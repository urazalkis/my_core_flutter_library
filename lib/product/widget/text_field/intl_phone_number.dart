import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/constant/text/text_constant.dart';
import '../../../core/extension/context_extension.dart';

class IntlPhoneNumber extends StatefulWidget {
  final TextEditingController? controller;
  final bool? filled;
  final bool? validator;
  final String? hintText;
  final double? width;
  final ValueChanged<String> onInputChanged;
  IntlPhoneNumber({Key? key, this.controller, this.filled, this.validator, this.hintText, required this.onInputChanged, this.width}) : super(key: key);

  @override
  _IntlPhoneNumberState createState() => _IntlPhoneNumberState();
}

class _IntlPhoneNumberState extends State<IntlPhoneNumber> {
  String? isoCode = 'TR';
  bool onInputValidated = false;
  bool? isValid;
  double calculateTextFieldHeight() {
    if (isValid == false) {
      if (context.screenHeightIsLessThan5Inch) {
        return 65;
      } else if (context.screenHeightIsLargerThan9Inch) {
        return 95;
      } else {
        return 75;
      }
    } else {
      if (context.screenHeightIsLessThan5Inch) {
        return 40;
      } else if (context.screenHeightIsLargerThan9Inch) {
        return 70;
      } else {
        return 50;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: calculateTextFieldHeight(),
      width: widget.width ?? context.screenWidth / 1.2,
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          widget.onInputChanged(number.phoneNumber!);
          setState(() {
            isoCode = number.isoCode;
          });
        },
        onInputValidated: (bool value) {
          setState(() {
            onInputValidated = value;
          });
        },
        selectorConfig: const SelectorConfig(selectorType: PhoneInputSelectorType.BOTTOM_SHEET, showFlags: false),
        ignoreBlank: true,
        autoValidateMode: AutovalidateMode.disabled,
        autoFocusSearch: true,
        // countries: const ['TR'],
        selectorTextStyle: const TextStyle(color: Colors.black),
        // initialValue: number,
        textFieldController: widget.controller,
        formatInput: true,
        inputDecoration: InputDecoration(
          hintText: widget.hintText,
          border: _buildOutlineInputBorder(context),
          focusedBorder: _buildOutlineInputBorder(context),
          enabledBorder: _buildOutlineInputBorder(context),
          disabledBorder: _buildOutlineInputBorder(context),
          filled: widget.filled,
          fillColor: widget.filled == true ? Colors.white : Colors.transparent,
        ),
        inputBorder: _buildOutlineInputBorder(context),
        initialValue: PhoneNumber(isoCode: isoCode),
        validator: (tfInput) {
          if (widget.validator == true) {
            setState(() {
              isValid = false;
            });
            if (tfInput!.isEmpty) {
              setState(() {
                isValid = false;
              });
              return TextConstant.dontEmptyThisFieldError;
            } else if (onInputValidated == false) {
              setState(() {
                isValid = false;
              });
              return "Geçersiz numara!";
            } else {
              setState(() {
                isValid = true;
              });
            }
          } else {
            setState(() {
              isValid = true;
            });
            return null;
          }
          return null;
        },
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: context.radiusAllCircularMin,
        borderSide: const BorderSide(
          width: 0.5,
          color: Colors.black,
        ));
  }
}

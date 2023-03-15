import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/text/text_constant.dart';
import '../../../core/widget/text_field/standard_text_formfield.dart';

class EmailTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool? validator;
  final double? width;
  final bool? filled;
  final String? hintText;
  final String? labelText;
  final bool? upLabel;
  const EmailTextFormField({Key? key, this.validator, required this.controller, this.width, this.filled, this.hintText, this.labelText, this.upLabel}) : super(key: key);

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  bool? isValid;

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      controller: widget.controller,
      width: widget.width,
      hintText: widget.hintText ?? 'E-Mail',
      labelText: widget.labelText,
      upLabel: widget.upLabel,
      maxLines: 1,
      filled: widget.filled,
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: Colors.black,
      ),
      isValid: isValid,
      validator: (tfInput) {
        if (tfInput!.isEmpty) {
          if (widget.validator == true) {
            setState(() {
              isValid = false;
            });
            return TextConstant.dontEmptyThisFieldError;
          } else {
            return null;
          }
        } else if (EmailValidator.validate(tfInput) == false) {
          setState(() {
            isValid = false;
          });
          return 'Geçerli bir email adres girin!';
        } else {
          setState(() {
            isValid = true;
          });
        }
      },
    );
  }
}

/*class EmailTextFormField extends StatelessWidget {
  final bool? validator;
  const EmailTextFormField({Key? key, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      height: context.screenHeight < DeviceSizeEnum.inch_5.size
          ? 40
          : context.screenHeight > DeviceSizeEnum.inch_9.size
              ? 70
              : 50,
      width: context.screenWidth / 1.2,
      hintText: 'Enter Email Address',
      prefixIcon: ImageSvg(
        path: ImagePath.email.path,
      ),
      validator: (tfInput) {
        if (tfInput!.isEmpty) {
          if (validator == true) {
            return "Bu alanı boş bırakmayınız!";
          } else {
            return null;
          }
        } else if (EmailValidator.validate(tfInput) == false) {
          return "Geçerli bir email girin!";
        }
        return null;
      },
    );
  }
}*/

import 'package:flutter/material.dart';

import '../../../core/constant/text/text_constant.dart';
import '../../../core/widget/text_field/standard_text_formfield.dart';

class UserTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? filled;
  final double? width;
  const UserTextFormField({Key? key, required this.controller, this.hintText, this.filled, this.width}) : super(key: key);

  @override
  State<UserTextFormField> createState() => _UserTextFormFieldState();
}

class _UserTextFormFieldState extends State<UserTextFormField> {
  bool? isValid;

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      controller: widget.controller,
      width: widget.width,
      hintText: widget.hintText ?? 'Kullanıcı Adı',
      maxLines: 1,
      filled: widget.filled,
      prefixIcon: const Icon(
        Icons.person_outline,
        color: Colors.black,
      ),
      isValid: isValid,
      validator: (tfInput) {
        if (tfInput!.isEmpty) {
          setState(() {
            isValid = false;
          });
          return TextConstant.dontEmptyThisFieldError;
        } else {
          setState(() {
            isValid = true;
          });
        }
        return null;
      },
    );
  }
}

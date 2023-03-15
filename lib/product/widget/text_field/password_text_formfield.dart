import 'package:flutter/material.dart';

import '../../../core/constant/text/text_constant.dart';
import '../../../core/widget/text_field/standard_text_formfield.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? filled;
  final double? width;
  const PasswordTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.filled,
    this.width,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool showPassword = false;
  bool? isValid;

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      controller: widget.controller,
      hintText: 'Şifre',
      filled: widget.filled,
      maxLines: 1,
      keyboardType: TextInputType.visiblePassword,
      width: widget.width,
      obscureText: !showPassword,
      prefixIcon: const Icon(
        Icons.lock_outline,
        color: Colors.black,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: Icon(
          showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Colors.black87,
        ),
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
      },
    );
  }
}

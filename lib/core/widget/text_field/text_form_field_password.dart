import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/constant/design/border_constant.dart';
import '/core/constant/design/color_constant.dart';

class TextFormFieldPassword extends StatefulWidget {
  final TextEditingController? tfController;
  final String? hintText;

  TextFormFieldPassword({
    Key? key,
    this.tfController,
    this.hintText,
  }) : super(key: key);

  @override
  _TextFormFieldPasswordState createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.tfController,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword,
      decoration: buildInputDecoration(),
      validator: (tfInput) {
        if (tfInput!.isEmpty) {
          return "Bu Alanı Boş Bırakmayınız!";
        }
        return null;
      },
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      prefixIcon:
          Icon(Icons.lock, color: ColorConstants.instance.customBlueColor),
      hintText: widget.hintText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderConstant.instance.radiusAllCircularMedium),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        child: Icon(
          showPassword ? Icons.visibility_off : Icons.visibility,
          color: ColorConstants.instance.customBlueColor,
        ),
      ),
    );
  }
}

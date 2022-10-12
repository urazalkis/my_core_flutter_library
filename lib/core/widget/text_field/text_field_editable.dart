import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '/core/extension/context_extension.dart';
import '/core/widget/text_field/text_form_field_standard.dart';
import '../../constant/design/color_constant.dart';
import '../../constant/text/error_text_message.dart';

class TextFieldEditable extends StatefulWidget {
  final TextEditingController? tfController;
  final String? labelText;
  final String? hintText;
  final double? height;
  final double? width;
  final bool? upLabel;
  final bool? filled;
  final Color? filledColor;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final VoidCallback? onSaved;
  late bool isSaving;
  final bool? borderEnable;

  TextFieldEditable({
    Key? key,
    required this.isSaving,
    this.tfController,
    this.labelText,
    this.hintText,
    this.width,
    this.upLabel,
    this.filled,
    this.filledColor,
    this.keyboardType,
    this.height,
    this.obscureText,
    this.onSaved,
    this.borderEnable,
  }) : super(key: key);

  @override
  _TextFieldEditableState createState() => _TextFieldEditableState();
}

class _TextFieldEditableState extends State<TextFieldEditable> {
  bool isEditing = false;
  final saveText = 'Kaydet';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: isEditing == true ? true : false,
          child: SizedBox(
            height: context.screenHeight / 15,
            width: context.screenWidth / 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.isSaving) {
                      return null;
                    } else {
                      widget.onSaved!();

                      setState(() {
                        isEditing = !isEditing;
                      });
                    }
                  },
                  child: Visibility(
                    visible: isEditing == true ? true : false,
                    child: widget.isSaving
                        ? SizedBox(
                            height: context.screenHeight / 30,
                            width: context.screenWidth / 20,
                            child: CircularProgressIndicator(
                              color: ColorConstants.instance.customBlueColor,
                            ))
                        : Icon(
                            Icons.save,
                            size: 25,
                            color: ColorConstants.instance.customBlueColor,
                          ),
                  ),
                ),
                Text(
                  saveText,
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        TextFormFieldStandard(
          tfController: widget.tfController,
          hintText: widget.hintText,
          borderEnable: widget.borderEnable,
          width: widget.width,
          height: widget.height,
          labelText: widget.labelText,
          filled: widget.filled ?? false,
          filledColor: widget.filledColor ?? Colors.white,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText ?? false,
          enabled: isEditing == true ? true : false,
          textColor: isEditing == false ? Colors.grey : Colors.black,
          validator: (tfInput) {
            if (tfInput!.isEmpty) {
              return ErrorText.instance.emptyFieldErrorText;
            }
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
          child: SizedBox(
            height: context.screenHeight / 15,
            width: context.screenWidth / 10,
            child: Icon(
              isEditing ? Icons.close : Icons.mode_edit,
              color: ColorConstants.instance.customBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/text/text_constant.dart';
import '../../../core/extension/context_extension.dart';

class DropDownSearchButton extends StatelessWidget {
  final List<String> itemNameList;
  final String? selectedItem;
  final String? labelText;
  final bool? validator;
  final String? validatorText;
  final bool? showSearchBox;
  final double? width;
  final double? height;
  final ValueChanged<String?>? onChanged;
  final Mode? mode;
  final bool? filled;
  final Color? menuBackgroundColor;
  final String? hintText;
  final bool? enabled;
  const DropDownSearchButton(
      {Key? key,
      this.width,
      this.height,
      this.filled,
      this.menuBackgroundColor,
      required this.itemNameList,
      this.selectedItem,
      this.labelText,
      this.validator,
      this.validatorText,
      this.showSearchBox,
      this.mode,
      this.onChanged,
      this.hintText,
      this.enabled})
      : super(key: key);
  OutlineInputBorder _buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: context.radiusAllCircularMin,
        borderSide: const BorderSide(
          width: 0.5,
          color: Colors.black,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: width,
      child: DropdownSearch<String>(
        enabled: enabled ?? true,
        popupProps: PopupProps.menu(
          showSearchBox: showSearchBox ?? true,
          showSelectedItems: true,
          menuProps: MenuProps(
            backgroundColor: menuBackgroundColor ?? Colors.white,
            shape: _buildOutlineInputBorder(context),
          ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              filled: filled ?? true,
              fillColor: Colors.white,
              helperStyle: const TextStyle(color: Colors.blue),
              helperText: "Buradan arama yapabilirsiniz",
              //border: _buildOutlineInputBorder(context),
            ),
          ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            border: _buildOutlineInputBorder(context),
            enabledBorder: _buildOutlineInputBorder(context),
            filled: true,
            fillColor: Colors.white,
            labelText: labelText,
            hintText: hintText,
            disabledBorder: _buildOutlineInputBorder(context),
          ),
        ),
        /*dropdownButtonProps: DropdownButtonProps(

        ),*/

        items: itemNameList,
        selectedItem: selectedItem,
        onChanged: (String? selectedData) {
          onChanged!(selectedData);
        },
        validator: (tfInput) {
          if (validator == true) {
            if (tfInput!.isEmpty) {
              return TextConstant.dontEmptyThisFieldError;
            }
          } else {
            return null;
          }
        },
      ),
    );
  }
}

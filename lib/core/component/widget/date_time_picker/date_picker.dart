import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '/core/constant/design/color_constant.dart';
import '/core/constant/text_format/date_format.dart';

class DatePickerCustom extends StatelessWidget {
  final LocaleType? locale;
  String? selectedDate;
  final String? labelText;
  final ValueChanged<String>? onConfirm;
  DatePickerCustom(
      {Key? key,
      this.locale,
      this.labelText,
      this.selectedDate,
      this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          theme: DatePickerTheme(
              headerColor: ColorConstants.instance.customBlueColor,
              backgroundColor: Colors.white,
              itemStyle: TextStyle(
                  color: ColorConstants.instance.customBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              cancelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              doneStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          onConfirm: (date) {
            if (kDebugMode) {
              print('confirm max $date');
            }
            onConfirm!(date.toString());
            selectedDate = date.toString();
          },
          currentTime:
              DateTime.parse(selectedDate ?? DateTime.now().toString()),
          locale: locale,
        );
      },
      child: SizedBox(
        width: 120,
        child: DropdownButtonFormField<String>(
          alignment: Alignment.center,
          hint: Text(
            DateFormatter.instance.date.format(
                DateTime.parse(selectedDate ?? DateTime.now().toString())),
            style: const TextStyle(fontFamily: 'Bozon', color: Colors.black),
          ),
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            label: Text(
              '$labelText',
              style: TextStyle(
                  fontFamily: 'Bozon',
                  color: ColorConstants.instance.customBlueColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          icon: Icon(Icons.arrow_drop_down,
              color: ColorConstants.instance.customBlueColor),
          onChanged: (String? value) {},
          items: [],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class DateFormatter {
  const DateFormatter._init();

  static final date = DateFormat('yyyy-MM-dd');
  static final time = DateFormat('HH:mm');
  static final time12 = DateFormat('hh:mm');
}

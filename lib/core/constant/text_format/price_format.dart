import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class PriceFormat {
  const PriceFormat._init();

  static final numberFormat = NumberFormat('#,##0.00', 'ID');
}

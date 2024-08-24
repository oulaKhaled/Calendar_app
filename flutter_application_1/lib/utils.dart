import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

//convert Date , Time Objects to String
class Utils {
  static String toDateTime(DateTime dateTime) {
    final data = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);
    return '$data $time';
  }

  static String toDate(DateTime dateTime) {
    final data = DateFormat.yMMMEd().format(dateTime);

    return '$data';
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);

    return '$time';
  }
}

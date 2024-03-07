
import 'package:flutter/material.dart';
import  'package:persian_number_utility/persian_number_utility.dart';

class Utils {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String getPrice(String smsBody) {
    print(smsBody);
    List<String> amounts = [];

    RegExp regex = RegExp(r'(برداشت|واریز|مبلغ|خرید)[:\s]*([-+]?\d{1,15}(?:,\d{3})*(?:\.\d{2})?)');
    Iterable<Match> matches = regex.allMatches(smsBody);

    // چک کردن برای وجود match
    if (matches != null) {
      for (Match match in matches) {
        String word = match.group(1)!;
        String amount = match.group(2)!;
        amounts.add(amount);
      }
    } else {
      return 'تطابق پیدا نشد.';
    }

    if (amounts.isNotEmpty) {
      return amounts.join(', '); // یا هر روش دیگری که برای نمایش لیست مناسب است
    } else {
      return 'تطابق پیدا نشد.';
    }
  }


  static String extractAmount(String smsBody) {
    RegExp regex = RegExp(r'\d+(,\d+)*[+-]?');
    Match? match = regex.firstMatch(smsBody);

    if (match != null) {
      return match.group(0)!;
    } else {
      return 'عدد پیدا نشد.';
    }
  }

  static String formatTimestamp(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)} ${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}:${_twoDigits(dateTime.second)}';
  }

  static String _twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    }
    return '0$n';
  }

  static String formatDateStr(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp).toPersianDateStr(showDayStr: true);
  }
}


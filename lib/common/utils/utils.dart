
import 'package:flutter/material.dart';

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
}


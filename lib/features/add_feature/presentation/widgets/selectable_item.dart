import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import  'package:persian_number_utility/persian_number_utility.dart';

import '../../../../common/utils/poolino_colors.dart';


class SelectableItem extends StatelessWidget {
  String title;
  String prefixText;
  String icon;
  Color colors;
  bool isDate;
  Function() onTap;

  SelectableItem({super.key,
    required this.title,
    required this.prefixText,
    required this.icon,
    required this.colors,
    required this.isDate,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SizedBox(
        height: 56,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Material(
            color: PoolinoColors.f0Color,
            child: InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      isDate ? DateTime.now().toPersianDateStr(showDayStr: true)  : prefixText, style: TextStyle(fontFamily: 'medium', color: colors),),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: Text(title, style: const TextStyle(fontFamily: 'regular', fontSize: 16, color: Colors.black87),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: SvgPicture.asset("assets/images/$icon", width: 28, height: 28,),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

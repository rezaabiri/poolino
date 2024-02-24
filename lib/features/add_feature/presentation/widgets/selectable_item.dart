import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectableItem extends StatelessWidget {
  String title;
  String prefixText;
  String icon;
  Color colors;
  Function() onTap;

  SelectableItem({super.key,
    required this.title,
    required this.prefixText,
    required this.icon,
    required this.colors,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SizedBox(
        height: 55,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Material(
            color: Colors.grey.shade200,
            child: InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(prefixText, style: TextStyle(fontFamily: 'medium', color: colors),),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: Text(title, style: TextStyle(fontFamily: 'regular', fontSize: 16, color: Colors.black87),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: SvgPicture.asset(icon, width: 24, height: 24,),
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

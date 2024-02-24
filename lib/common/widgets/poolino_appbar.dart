import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PoolinoAppBar extends StatelessWidget {
  String title;
  String description;
  String icon;
  Function() onTap;

  PoolinoAppBar({super.key, required this.title,
    required this.description, required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Material(
                color: Colors.grey.shade200,
                child: InkWell(
                  onTap: onTap,
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: Colors.black,),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(title, style: TextStyle(fontFamily: 'regular', fontSize: 14),),
                    SizedBox(width: 12,),
                    SvgPicture.asset(icon, width: 24, height: 24,),
                  ],
                ),
                SizedBox(height: 6,),
                Text(description, style: TextStyle(fontFamily: 'regular', fontSize: 14, color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

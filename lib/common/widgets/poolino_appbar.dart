import 'package:flutter/material.dart';
import 'package:poolino/common/utils/poolino_colors.dart';


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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: PoolinoColors.f0Color,
                child: InkWell(
                  onTap: onTap,
                  child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.info_outlined, size: 24, color: Colors.black,),
                  ),
                ),
              ),
            ),
            Text(title, style: const TextStyle(fontFamily: 'medium', fontSize: 14),),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: PoolinoColors.f0Color,
                child: InkWell(
                  onTap: onTap,
                  child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 24, color: Colors.black,),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

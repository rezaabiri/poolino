import 'package:flutter/material.dart';

import '../../../../common/theme/ThemeSwitcher.dart';
import '../../../../common/utils/poolino_colors.dart';
import '../../../../common/utils/utils.dart';

class ToolbarWidget extends StatelessWidget  {
  Function() onTap;
  ToolbarWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: PoolinoColors.f9Color,
              child: InkWell(
                onTap: onTap,
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.person_2_outlined, size: 25, color: Colors.black,),
                ),
              ),
            ),
          ),
          Text(".پولینو", style: TextStyle(fontFamily: "medium", fontSize: 22, color: PoolinoColors.baseColor)),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: PoolinoColors.f9Color,
              child: const SizedBox(
                height: 40,
                width: 40,
                child: ThemeSwitcher(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
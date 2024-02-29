import 'package:flutter/material.dart';

import '../../../../common/theme/ThemeSwitcher.dart';
import '../../../../common/utils/poolino_colors.dart';
import '../../../../common/utils/utils.dart';

class ToolbarWidget extends StatelessWidget  {
  Function() profile;
  Function() menu;
  ToolbarWidget({super.key, required this.profile, required this.menu});

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
                onTap: profile,
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
              child: SizedBox(
                height: 40,
                width: 40,
                child: IconButton(onPressed : menu, icon: const Icon(Icons.menu_rounded, color: Colors.black,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
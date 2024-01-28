import 'package:flutter/material.dart';
import 'package:poolino/common/constants.dart';
import 'package:poolino/common/poolino_colors.dart';

import '../../../../common/theme/ThemeSwitcher.dart';
import '../../../../common/utils/utils.dart';

class ToolbarWidget extends StatelessWidget  {
  Function() onTap;
  ToolbarWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Material(
              color: theme.cardColor,
              child: InkWell(
                onTap: onTap,
                child: const SizedBox(
                  height: 55,
                  width: 55,
                  child: Icon(Icons.person_2_outlined, size: 32, color: Colors.black,),
                ),
              ),
            ),
          ),
          Text(".پولینو", style: TextStyle(fontFamily: "medium", fontSize: 22, color: PoolinoColors.baseColor)),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Material(
              color: theme.cardColor,
              child: const SizedBox(
                height: 55,
                width: 55,
                child: ThemeSwitcher(),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
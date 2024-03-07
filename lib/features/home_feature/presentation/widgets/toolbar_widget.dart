import 'package:flutter/material.dart';

import '../../../../common/utils/poolino_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolbarWidget extends StatelessWidget  {
  String icon;
  Function() onTap;
  ToolbarWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: PoolinoColors.f0Color,
        child: SizedBox(
          height: 40,
          width: 40,
          child: IconButton(onPressed : onTap,
              icon: SvgPicture.asset("assets/images/$icon", width: 28, height: 28)),
        ),
      ),
    );
  }
}
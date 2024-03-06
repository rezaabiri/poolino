import 'package:flutter/material.dart';

import '../../../../common/utils/poolino_colors.dart';

class ToolbarWidget extends StatelessWidget  {
  Function() onTap;
  ToolbarWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: PoolinoColors.f0Color,
        child: SizedBox(
          height: 40,
          width: 40,
          child: IconButton(onPressed : onTap, icon: const Icon(Icons.menu_rounded, color: Colors.black,)),
        ),
      ),
    );
  }
}
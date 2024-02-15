import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/utils/utils.dart';


class ButtonWidget extends StatelessWidget {
  String name;
  String icon;
  Function() onTap;
  ButtonWidget({super.key, required this.name, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: theme.cardColor,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 105,
            width: MediaQuery.of(context).size.width /3.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/$icon.svg'),
                const SizedBox(height: 14,),
                Text(name, style: const TextStyle(fontFamily: "medium", fontSize: 12, color: Colors.black))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ButtonWidget extends StatelessWidget {
  String name;
  String icon;
  Function() onTap;
  ButtonWidget({super.key, required this.name, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: hexToColor('#F2F6FF'),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 105,
            width: MediaQuery.of(context).size.width /3.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/$icon.svg'),
                const SizedBox(height: 14,),
                Text(name, style: const TextStyle(fontFamily: "yekan_bold", fontSize: 14, color: Colors.black))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

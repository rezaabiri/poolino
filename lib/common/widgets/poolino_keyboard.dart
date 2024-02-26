import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/poolino_colors.dart';



typedef CallBack = void Function(String value);

@immutable
class PoolinoKeyboard extends StatelessWidget {
  String value;
  String type;
  final CallBack onTap;

  PoolinoKeyboard({super.key, required this.value, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Material(
          color: type=="number" ? PoolinoColors.f7Color : ( type == "icon" ? PoolinoColors.f7Color : PoolinoColors.baseColor),
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            onTap: () {
              onTap(value);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height * 0.70,
              child: Center(
                child: type=="icon" ? SvgPicture.asset('assets/images/ic_clear_keyboard.svg') : Text(value, style: TextStyle(
                    fontFamily: 'yekan_semibold',
                    fontSize: type=="number" ? 24 : 16,
                    color: type=="number" ? Colors.black : Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

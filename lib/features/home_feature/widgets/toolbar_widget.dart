import 'package:flutter/material.dart';

import '../../../common/utils/utils.dart';

class ToolbarWidget extends StatelessWidget  {
  Function() onTap;
  ToolbarWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Material(
                color: Utils.hexToColor("#F7F7F7"),
                child: InkWell(
                  onTap: onTap,
                  child: const SizedBox(
                    height: 55,
                    width: 55,
                    child: Icon(Icons.notifications_active_outlined, size: 32, color: Colors.black,),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(".پولینو", style: TextStyle(fontFamily: "yekan_bold", fontSize: 18, color: Colors.blue)),
            SizedBox(height: 7,),
            Text(" (: به پولینو خوش آمدید", style: TextStyle(fontFamily: "yekan_bold", fontSize: 14, color: Colors.black)),

          ],
        ),
      ],
    );
  }
}
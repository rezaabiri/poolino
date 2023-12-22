import 'package:flutter/material.dart';

class ToolbarWidget extends StatelessWidget implements PreferredSizeWidget {
  Function() onTap;
  ToolbarWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Material(
                  color: hexToColor("#F7F7F7"),
                  child: InkWell(
                    onTap: onTap,
                    child: SizedBox(
                      height: 55,
                      width: 55,
                      child: Icon(Icons.notifications_active_outlined, size: 32, color: Colors.black,),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(".پولینو", style: TextStyle(fontFamily: "yekan_bold", fontSize: 18, color: Colors.blue)),
              SizedBox(height: 7,),
              Text(" (: به پولینو خوش آمدید", style: TextStyle(fontFamily: "yekan_bold", fontSize: 14, color: Colors.black)),

            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

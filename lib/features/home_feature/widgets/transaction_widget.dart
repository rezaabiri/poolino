import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TransactionWidget extends StatelessWidget {
  String price;
  String title;
  String date;
  int state;
  Function() onTap;
  TransactionWidget({super.key, required this.price, required this.title, required this.date, required this.state, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(price, style: const TextStyle(fontFamily: "yekan_bold", fontSize: 20, color: Colors.black)),
                    SizedBox(height: 6,),
                    Text("تومان", style: TextStyle(fontFamily: "yekan_regular", fontSize: 14, color: hexToColor("#676767")))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(title, style: const TextStyle(fontFamily: "yekan_bold", fontSize: 16, color: Colors.black)),
                    SizedBox(height: 10,),
                    Text(date, style: TextStyle(fontFamily: "yekan_regular", fontSize: 14, color: hexToColor("#676767")))
                  ],
                ),
              ),
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: state == 1 ? hexToColor("#FFF8F8") : hexToColor("#F5FCF6")
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: state==1 ? SvgPicture.asset('assets/images/kharj.svg', width: 35, height: 35) : SvgPicture.asset('assets/images/daramad.svg', width: 35, height: 35),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
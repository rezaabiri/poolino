import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poolino/common/utils/poolino_colors.dart';

import '../../../../common/utils/utils.dart';

class TransactionWidget extends StatelessWidget {
  String price;
  String title;
  String date;
  int state;
  Function() onTap;
  TransactionWidget({super.key, required this.price, required this.title, required this.date, required this.state, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(price, style: const TextStyle(fontFamily: "medium", fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 6,),
                      Text("تومان", style: TextStyle(fontFamily: "regular", fontSize: 12, color: Utils.hexToColor("#676767")))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(title, style: const TextStyle(fontFamily: "medium", fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 10,),
                      Text(date, style: TextStyle(fontFamily: "regular", fontSize: 12, color: Utils.hexToColor("#676767")))
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Utils.hexToColor("#ffffff")
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset('assets/images/card_edit.svg', width: 28, height: 28),
                  ),
                )
              ],
            ),
            Builder(
              builder: (context) {
                if(state == 1){
                  return Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: DottedLine(
                      dashColor: PoolinoColors.d9Color,
                      dashLength: 10,
                      dashGapLength: 5,
                      lineThickness: 1.8,
                      dashGapRadius: 10,
                      dashRadius: 10,
                    ),
                  );
                }
                return Container();
              }
            ),
          ],
        ),
      ),
    );
  }
}
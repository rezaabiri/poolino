import 'package:flutter/material.dart';
import 'package:poolino/features/home_feature/widgets/button_widget.dart';
import 'package:poolino/features/home_feature/widgets/transaction_widget.dart';

import '../widgets/card_money.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  int hexToInteger(String hex) => int.parse(hex, radix: 16);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            CardMoney(cost: "15,000,330", income: "23,000,000", total: "120,000,000",),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(name: "گزارش حساب", icon: "report_blue", onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("گزارش")));
                }),
                ButtonWidget(name: "ثبت درآمد", icon: "income_blue", onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ثبت درآمد")));

                }),
                ButtonWidget(name: "ثبت هزینه", icon: "cost_blue", onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ثبت هزینه")));

                }),
              ],
            ),
            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("مشاهده همه", style: const TextStyle(fontFamily: "yekan_bold", fontSize: 16, color: Colors.blue)),
                Text("تراکنش های اخیر", style: const TextStyle(fontFamily: "yekan_bold", fontSize: 16, color: Colors.black))
              ],
            ),
            SizedBox(height: 18,),
            TransactionWidget(
              price: "1,340,000",
              title: "خرید های الکی",
              date: "یکشنبه ۱۲ آذر ۱۴۰۲ ۱۹۲۰",
              state: 1,
            ),
            TransactionWidget(
              price: "3,450,000",
              title: "پروژه برنامه نویسی",
              date: "دوشنبه ۲۳ آذر ۱۴۰۲ ۲۰:۴۵",
              state: 2,
            ),
          ],
        ),
      ),
    );
  }
}
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}


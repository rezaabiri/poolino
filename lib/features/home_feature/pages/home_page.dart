import 'package:flutter/material.dart';
import 'package:poolino/features/home_feature/bottom_sheets/add_cost.dart';
import 'package:poolino/features/home_feature/widgets/button_widget.dart';
import 'package:poolino/features/home_feature/widgets/transaction_widget.dart';

import '../widgets/card_money.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/toolbar_widget.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});


  int hexToInteger(String hex) => int.parse(hex, radix: 16);

  @override
  Widget build(BuildContext context) {
    List<String> prices = ["1,230,000", "3,400,200", "500,000", "4,103,000", "8,000,000", "2,300,000"];
    List<String> titles = ["خرید طلای آبشده", "پروژه برنامه نویسی", "هارد لپ تاپ", "مانیتور 27 سامسونگ", "لپ تاپ استوک", "رم 16 گیگ پی سی"];
    List<int> states = [1, 2, 1, 1,2, 2];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ToolbarWidget(onTap: (){},),
              const SizedBox(height: 18,),
              CardMoney(cost: "15,000,330", income: "23,000,000", total: "120,000,000",),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(name: "گزارش حساب", icon: "report_blue", onTap: (){

                  }),
                  ButtonWidget(name: "ثبت درآمد", icon: "income_blue", onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ثبت درآمد")));

                  }),
                  ButtonWidget(name: "ثبت هزینه", icon: "cost_blue", onTap: (){
                    AddCost add = AddCost();
                    add.showModal(context, onTapChoose: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ثبت هزینه انتخابی")));
                      Navigator.pop(context);
                    }, onTapCustom: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ثبت هزینه دستی")));
                      Navigator.pop(context);
                    });

                  }),
                ],
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("مشاهده همه (${states.length})", style: const TextStyle(fontFamily: "yekan_bold", fontSize: 16, color: Colors.blue)),
                  Text("تراکنش های اخیر", style: const TextStyle(fontFamily: "yekan_bold", fontSize: 16, color: Colors.black))
                ],
              ),
              const SizedBox(height: 18,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return TransactionWidget(
                      price: prices[index],
                      title: titles[index],
                      date: "یکشنبه ۱۲ آذر ۱۴۰۲ ۱۹۲۰",
                      state: states[index],
                    );

                  })

            ],
          ),
        ),
      ),
    );
  }
}
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}


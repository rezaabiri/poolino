import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CardMoney extends StatelessWidget {
  String cost;
  String income;
  String total;
  CardMoney({super.key, required this.cost, required this.income, required this.total});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: hexToColor("#2969FF")
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 105,
                decoration: BoxDecoration(
                    color: hexToColor('#F2F6FF'),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)
                    )
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/icon/kharj.svg'),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("هزینه ها", style: TextStyle(fontFamily: "yekan_bold", fontSize: 16, color: Colors.red),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Text("تومان", style: TextStyle(fontFamily: "yekan_regular", fontSize: 14, color: Colors.black)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(cost, style: TextStyle(fontFamily: "yekan_regular", fontSize: 18, color: Colors.black)),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/daramad.svg'),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("درآمد ها", style: TextStyle(fontFamily: "yekan_bold", fontSize: 16, color: Colors.green),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Text("تومان", style: TextStyle(fontFamily: "yekan_regular", fontSize: 14, color: Colors.black)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(income, style: TextStyle(fontFamily: "yekan_regular", fontSize: 18, color: Colors.black)),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.03,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("مانده حساب", style: TextStyle(fontFamily: "yekan_bold", fontSize: 14, color: Colors.white),),
                Row(
                  children: [
                    Text(total, style: TextStyle(fontFamily: "yekan_bold", fontSize: 35, color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("تومان", style: TextStyle(fontFamily: "yekan_bold", fontSize: 14, color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
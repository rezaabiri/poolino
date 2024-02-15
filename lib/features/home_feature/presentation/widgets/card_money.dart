import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/utils/utils.dart';


class CardMoney extends StatelessWidget {
  String cost;
  String income;
  String total;
  CardMoney({super.key, required this.cost, required this.income, required this.total});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          children: [
            SvgPicture.asset("assets/images/card_bg.svg",),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.03,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("مانده حساب", style: TextStyle(fontFamily: "regular", fontSize: 16, color: Colors.white),),
                    Row(
                      children: [
                        Text(total, style: const TextStyle(fontFamily: "bold", fontSize: 32, color: Colors.white)),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("تومان", style: TextStyle(fontFamily: "medium", fontSize: 16, color: Colors.white)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 105,
              decoration: BoxDecoration(
                  color: Utils.hexToColor('#F2F6FF'),
                  borderRadius: const BorderRadius.only(
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
                            SvgPicture.asset('assets/images/kharj.svg'),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("هزینه ها", style: TextStyle(fontFamily: "medium", fontSize: 16, color: Colors.red),),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              const Text("تومان", style: TextStyle(fontFamily: "medium", fontSize: 12, color: Colors.black)),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(cost, style: const TextStyle(fontFamily: "medium", fontSize: 16, color: Colors.black)),
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
                            SvgPicture.asset('assets/images/daramad.svg'),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("درآمد ها", style: TextStyle(fontFamily: "medium", fontSize: 16, color: Colors.green),),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              const Text("تومان", style: TextStyle(fontFamily: "medium", fontSize: 12, color: Colors.black)),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(income, style: const TextStyle(fontFamily: "medium", fontSize: 16, color: Colors.black)),
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
      ],
    );
  }
}

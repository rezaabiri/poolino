import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/utils/poolino_colors.dart';

class AddCost {
  Future<void> showModal(context,
      {required Function() onTapChoose,
      required Function() onTapCustom}) async {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      showDragHandle: true,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 210,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Material(
                    color: PoolinoColors.f0Color,
                    child: InkWell(
                      onTap: onTapChoose,
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset("assets/images/arrow_left.svg"),
                              Row(
                                children: [
                                  const Text(
                                    "انتخاب از پیامک های بانکی",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "regular"),
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 2,
                                    color: PoolinoColors.e4Color,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  SvgPicture.asset(
                                      "assets/images/message.svg"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Material(
                    color: PoolinoColors.f0Color,
                    child: InkWell(
                      onTap: onTapCustom,
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset("assets/images/arrow_left.svg"),
                              Row(
                                children: [
                                  const Text(
                                    "ثبت هزینه به صورت دستی",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "regular"),
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 2,
                                    color: PoolinoColors.e4Color,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  SvgPicture.asset(
                                      "assets/images/add_cost_icon.svg"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/utils/poolino_colors.dart';

class ChooseCategory {
  Future<void> showModal(context, {
    required Function() onTapChoose,
  }) async {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index){
              return categoryItem(context, onTapChoose);
            },
          )
        );
      },
    );
  }

  Widget categoryItem(context, onTapChoose){
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Material(
          color: Colors.grey.shade200,
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
                        const Text("انتخاب از پیامک های بانکی", style: TextStyle(fontSize: 16, fontFamily: "yekan_regular"),),
                        const SizedBox(width: 14,),
                        Container(height: 40, width: 2, color: PoolinoColors.e4Color,),
                        const SizedBox(width: 14,),
                        SvgPicture.asset("assets/images/choose_sms.svg"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );

  }

}


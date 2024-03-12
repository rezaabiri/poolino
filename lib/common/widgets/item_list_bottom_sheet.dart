import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/add_feature/models/category_model.dart';
import '../utils/poolino_colors.dart';
class ListItemBottomSheet extends StatelessWidget {
  Function(String) onTapChoose;
  List<CategoryModel> categoryModels;
  ListItemBottomSheet({super.key, required this.categoryModels, required this.onTapChoose});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categoryModels.length,
      itemBuilder: (context, index){
        return priorityItem(context, () => onTapChoose(categoryModels[index].title), categoryModels[index].icon, categoryModels[index].title);
      },
    );
  }
  Widget priorityItem(context, Function() onTapChoose, String icon, String title){
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: ClipRRect(
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
                          Text(title, style: const TextStyle(fontSize: 16, fontFamily: "regular"),),
                          const SizedBox(width: 14,),
                          SvgPicture.network(
                            "https://offerja.ir/poolino_icons/$icon.svg",
                            placeholderBuilder: (BuildContext context) {
                              return const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeCap: StrokeCap.round,
                                    color: Colors.grey,
                                    strokeWidth: 3,
                                  )
                              );
                            }

                          ),
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

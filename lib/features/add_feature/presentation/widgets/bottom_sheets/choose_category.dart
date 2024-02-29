import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/utils/poolino_colors.dart';
import '../../../domain/models/category_model.dart';

class ChooseCategory {

  Future<void> showModal(context, {
    required Function() onTapChoose,
  }) async {

    List<CategoryModel> categoryModels = [];
    categoryModels.add(CategoryModel(icon: "", title: "دسته 1"));
    categoryModels.add(CategoryModel(icon: "", title: "دسته 2"));
    categoryModels.add(CategoryModel(icon: "", title: "دسته 3"));
    categoryModels.add(CategoryModel(icon: "", title: "دسته 4"));
    categoryModels.add(CategoryModel(icon: "", title: "دسته 5"));
    categoryModels.add(CategoryModel(icon: "", title: "دسته 6"));
    categoryModels.add(CategoryModel(icon: "", title: "دسته 7"));
    categoryModels.add(CategoryModel(icon: "", title: "دسته 8"));

    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      showDragHandle: const bool.fromEnvironment("handle", defaultValue: true),
      elevation: 0,
      isScrollControlled: false,
      enableDrag: true,
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
            itemCount: categoryModels.length,
            itemBuilder: (context, index){
              return categoryItem(context, onTapChoose, categoryModels[index].icon, categoryModels[index].title);
            },
          )
        );
      },
    );
  }

  Widget categoryItem(context, onTapChoose, String icon, String title){
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Material(
          color: PoolinoColors.f9Color,
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
                        Container(height: 40, width: 2, color: PoolinoColors.e4Color,),
                        const SizedBox(width: 14,),
                        SvgPicture.asset(icon),
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


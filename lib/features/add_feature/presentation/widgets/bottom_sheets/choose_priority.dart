import 'package:flutter/material.dart';
import 'package:poolino/common/widgets/item_list_bottom_sheet.dart';

import '../../../models/category_model.dart';


class ChoosePriority {

  Future<void> showModal(context, {
    required Function(String) onTapChoose,
  }) async {

    List<CategoryModel> categoryModels = [];
    categoryModels.add(CategoryModel(icon: "priority/arrow-square-up", title: "ضروری"));
    categoryModels.add(CategoryModel(icon: "priority/arrow-square-left", title: "معمولی"));
    categoryModels.add(CategoryModel(icon: "priority/arrow-square-down", title: "غیر ضروری"));


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
          child: ListItemBottomSheet(categoryModels: categoryModels, onTapChoose: onTapChoose,),
        );
      },
    );
  }



}


import 'package:flutter/material.dart';

import '../../../../../common/widgets/item_list_bottom_sheet.dart';
import '../../../domain/models/category_model.dart';

class ChooseCategory {

  Future<void> showModal(context, {
    required Function(String) onTapChoose,
  }) async {

    List<CategoryModel> categoryModels = [];
    categoryModels.add(CategoryModel(icon: "khordani", title: "خوردنی"));
    categoryModels.add(CategoryModel(icon: "shop", title: "خرید"));
    categoryModels.add(CategoryModel(icon: "r_a", title: "رفت و آمد"));
    categoryModels.add(CategoryModel(icon: "home_1", title: "خونه"));
    categoryModels.add(CategoryModel(icon: "funny", title: "خوش گذرونی"));
    categoryModels.add(CategoryModel(icon: "health", title: "سلامتی"));
    categoryModels.add(CategoryModel(icon: "gift", title: "هدیه"));

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


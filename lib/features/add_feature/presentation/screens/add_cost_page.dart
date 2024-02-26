import 'package:flutter/material.dart';
import 'package:poolino/common/utils/poolino_colors.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_text_field.dart';
import 'package:poolino/features/add_feature/domain/models/category_model.dart';
import 'package:poolino/features/add_feature/presentation/widgets/bottom_sheets/choose_category.dart';
import 'package:poolino/features/add_feature/presentation/widgets/selectable_item.dart';
import  'package:persian_number_utility/persian_number_utility.dart';

import '../widgets/add_text_field.dart';
import '../widgets/note_text_field.dart';

class AddCostPage extends StatefulWidget {
  AddCostPage({super.key, required this.price});

  String price;


  @override
  State<AddCostPage> createState() => _AddCostPageState();
}

class _AddCostPageState extends State<AddCostPage> {

  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.text = widget.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16,),
        AddTextField(
          formKey: formKey,
          hint: "مبلغ",
          prefixText: "تومان",
          icon: "assets/images/moneys.svg",
          controller: controller,
        ),
        const SizedBox(height: 8,),
        SelectableItem(
          title: "تاریخ",
          prefixText: DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString(),
          icon: "assets/images/calendar.svg",
          colors: PoolinoColors.baseColor,
          isDate: true,
          onTap: (){
            print(controller.text);
          },
        ),
        SelectableItem(
          title: "دسته بندی هزینه",
          prefixText: "انتخاب کنید",
          icon: "assets/images/category.svg",
          colors: PoolinoColors.baseColor,
          isDate: false,
          onTap: (){
            ChooseCategory().showModal(context, onTapChoose: (){

            });
          },
        ),
        SelectableItem(
          title: "اولویت هزینه",
          prefixText: "انتخاب کنید",
          icon: "assets/images/status.svg",
          colors: PoolinoColors.baseColor,
          isDate: false,
          onTap: (){},
        ),
        const SizedBox(height: 8,),
        NoteTextField(
            formKey: formKey,
            hint: "مبلغ",
            prefixText: "تومان",
            icon: "assets/images/note.svg",
            controller: controller
        ),

        SizedBox(height: 16,),
        ButtonPrimary(text: "ثبت هزینه", isEnabled: false, onPressed: (){})
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poolino/common/widgets/poolino_text_field.dart';
import 'package:poolino/features/add_feature/presentation/widgets/selectable_item.dart';

import '../widgets/add_text_field.dart';
import '../widgets/note_text_field.dart';

class AddCostPage extends StatefulWidget {
  const AddCostPage({super.key});

  @override
  State<AddCostPage> createState() => _AddCostPageState();
}

class _AddCostPageState extends State<AddCostPage> {

  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: 16,),
        AddTextField(
            formKey: formKey,
            hint: "مبلغ",
            prefixText: "تومان",
            icon: "assets/images/moneys.svg",
            controller: controller
        ),
        const SizedBox(height: 8,),
        SelectableItem(
          title: "تاریخ",
          prefixText: DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString(),
          icon: "assets/images/calendar.svg",
          colors: Colors.blue,
          onTap: (){},
        ),
        SelectableItem(
          title: "دسته بندی هزینه",
          prefixText: "انتخاب کنید",
          icon: "assets/images/category.svg",
          colors: Colors.grey.shade400,
          onTap: (){},
        ),
        SelectableItem(
          title: "اولویت هزینه",
          prefixText: "انتخاب کنید",
          icon: "assets/images/status.svg",
          colors: Colors.grey.shade400,
          onTap: (){},
        ),
        NoteTextField(
            formKey: formKey,
            hint: "مبلغ",
            prefixText: "تومان",
            icon: "assets/images/note.svg",
            controller: controller
        ),
      ],
    );
  }
}

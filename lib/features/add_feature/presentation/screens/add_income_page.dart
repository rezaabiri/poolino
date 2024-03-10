import 'package:flutter/material.dart';
import 'package:poolino/common/utils/constants.dart';
import 'package:poolino/common/utils/poolino_colors.dart';
import 'package:poolino/common/widgets/bottom_sheets/choose_date.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/features/add_feature/data/cost_params.dart';
import 'package:poolino/features/add_feature/presentation/bloc/add_cost_bloc/add_cost_status.dart';
import 'package:poolino/features/add_feature/presentation/bloc/category_cubit/category_cubit.dart';
import 'package:poolino/features/add_feature/presentation/bloc/priority_cubit/priority_cubit.dart';
import 'package:poolino/features/add_feature/presentation/widgets/bottom_sheets/choose_category.dart';
import 'package:poolino/features/add_feature/presentation/widgets/bottom_sheets/choose_priority.dart';
import 'package:poolino/features/add_feature/presentation/widgets/selectable_item.dart';
import  'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/loading_screen.dart';
import '../bloc/add_cost_bloc/add_cost_bloc.dart';
import '../widgets/add_text_field.dart';
import '../widgets/note_text_field.dart';

class AddIncomePage extends StatefulWidget {
  AddIncomePage({super.key, required this.price});
  String price;

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {

  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String date = "";
  String category = "";
  String priority = "";

  @override
  void initState() {
    priceController.text = widget.price
        .replaceAll("-", "").replaceAll("+", "");
    super.initState();
  }
  @override
  void dispose() {
    category = "انتخاب کنید";
    priority = "انتخاب کنید";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          AddTextField(
            formKey: formKey,
            hint: "مبلغ",
            prefixText: "تومان",
            icon: "moneys.svg",
            controller: priceController,
          ),
          const SizedBox(
            height: 8,
          ),
          Builder(
              builder: (context) {
                date = DateTime.now().toPersianDateStr(showDayStr: true);
                return SelectableItem(
                  title: "تاریخ",
                  prefixText: DateTime.now().toPersianDateStr(showDayStr: true),
                  icon: "calendar_edit.svg",
                  colors: PoolinoColors.baseColor,
                  isDate: true,
                  onTap: () {
                    ChooseDate().showModal(context, onTapChoose: () {});
                  },
                );
              }
          ),
          BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
            return SelectableItem(
              title: "دسته بندی هزینه",
              prefixText: state.category,
              icon: "category.svg",
              colors: PoolinoColors.baseColor,
              isDate: false,
              onTap: () {
                ChooseCategory().showModal(
                  context,
                  onTapChoose: (name) {
                    category = name;
                    Navigator.pop(context);
                    BlocProvider.of<CategoryCubit>(context)
                        .changeCategory(name);
                  },
                );
              },
            );
          }),
          const SizedBox(
            height: 8,
          ),
          NoteTextField(
              formKey: formKey,
              hint: "مبلغ",
              prefixText: "تومان",
              icon: "note.svg",
              controller: descController),
          const SizedBox(
            height: 16,
          ),

          BlocConsumer<AddCostBloc, AddCostState>(
            listenWhen: (previous, current) {
              if (current.addStatus is AddCostLoading) {
                LoadingScreen.show(context: context);
              }
              if (current.addStatus is AddCostComplete) {
                LoadingScreen.hide(context);
                PoolinoSnackBar(icon: "tick.svg", type: Constants.SUCCESS).show(context, "هزینه با موفقیت ثبت شد");
              }if (current.addStatus is AddCostError) {
                AddCostError u = current.addStatus as AddCostError;
                LoadingScreen.hide(context);
                if(u.message!="logout") PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, u.message);
                return true;
              }
              return false;
            },
            listener: (context, state){},
            builder: (context, state){
              return ButtonPrimary(text: "ثبت درآمد", isEnabled: true, onPressed: () {
                //validate();
              });
            },

          ),
        ],
      ),
    );
  }
}

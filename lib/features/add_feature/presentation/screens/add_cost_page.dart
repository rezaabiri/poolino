import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import '../../../../common/utils/loading_screen.dart';
import '../bloc/add_cost_bloc/add_cost_bloc.dart';
import '../widgets/add_text_field.dart';
import '../widgets/note_text_field.dart';

class AddCostPage extends StatefulWidget {
  AddCostPage({super.key, required this.price});

  String price;

  @override
  State<AddCostPage> createState() => _AddCostPageState();
}

class _AddCostPageState extends State<AddCostPage> {
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
    BlocProvider.of<CategoryCubit>(context).changeCategory("انتخاب کنید");
    BlocProvider.of<PriorityCubit>(context).changePriority("انتخاب کنید");
    super.initState();
  }

  @override

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
                icon: "calendar.svg",
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
          BlocBuilder<PriorityCubit, PriorityState>(
              builder: (context, state){
            return SelectableItem(
              title: "اولویت هزینه",
              prefixText: state.priority,
              icon: "chart.svg",
              colors: PoolinoColors.baseColor,
              isDate: false,
              onTap: () {
                ChoosePriority().showModal(context, onTapChoose: (name){
                  priority = name;
                  Navigator.pop(context);
                  BlocProvider.of<PriorityCubit>(context)
                      .changePriority(name);
                });
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
                Navigator.pop(context);
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
              return ButtonPrimary(text: "ثبت هزینه", isEnabled: true, onPressed: () {
                validate();
              });
            },

          ),
      ],
      ),
    );
  }

  void validate(){
    if(priceController.value.text.isEmpty || priceController.value.text == "0"){
      PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, "مبلغ را صحیح وارد نمایید");
    }else if(category == ""){
      PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, "دسته بندی الزامی است");
    }else if(priority == ""){
      PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, "اولویت هزینه الزامی است");
    }else if(descController.value.text.isEmpty) {
      PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, "توضیحات الزامی است");
    }else {
      CostParams costParams = CostParams(priceController.text, date, category, priority, descController.text);
      BlocProvider.of<AddCostBloc>(context).add(LoadAddEvent(costParams));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:poolino/common/utils/constants.dart';
import 'package:poolino/common/utils/poolino_colors.dart';
import 'package:poolino/common/widgets/bottom_sheets/choose_date.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/features/add_feature/data/income_params.dart';
import 'package:poolino/features/add_feature/presentation/bloc/add_income_bloc/add_income_status.dart';
import 'package:poolino/features/add_feature/presentation/bloc/category_cubit/category_cubit.dart';
import 'package:poolino/features/add_feature/presentation/widgets/bottom_sheets/choose_category.dart';
import 'package:poolino/features/add_feature/presentation/widgets/selectable_item.dart';
import  'package:persian_number_utility/persian_number_utility.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/loading_screen.dart';
import '../bloc/add_income_bloc/add_income_bloc.dart';
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
    String price = widget.price.replaceAll("-", "").replaceAll("+", "").beToman().seRagham(separator: ",");
    priceController.text = price;
    BlocProvider.of<CategoryCubit>(context).changeCategory("انتخاب کنید");
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: height * 0.12),
            child: Column(
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
                  },
                ),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
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
                  },
                ),
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
                BlocConsumer<AddIncomeBloc, AddIncomeState>(
                  listenWhen: (previous, current) {
                    if (current.addStatus is AddIncomeLoading) {
                      LoadingScreen.show(context: context);
                    }
                    if (current.addStatus is AddIncomeComplete) {
                      LoadingScreen.hide(context);
                      PoolinoSnackBar(icon: "tick.svg", type: Constants.SUCCESS)
                          .show(context, "درآمد با موفقیت ثبت شد");
                      Navigator.pop(context);
                    }
                    if (current.addStatus is AddIncomeError) {
                      AddIncomeError u = current.addStatus as AddIncomeError;
                      LoadingScreen.hide(context);
                      if (u.message == "logout") {
                        print("logout");
                        Navigator.pushNamed(context, "/phone");
                        // PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR)
                        //     .show(context, u.message);
                      }
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ButtonPrimary(
                      text: "ثبت درآمد",
                      isEnabled: true,
                      onPressed: () {
                        validate();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate(){
    if(priceController.value.text.isEmpty || priceController.value.text == "0"){
      PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, "مبلغ را صحیح وارد نمایید");
    }else if(category == ""){
      PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, "دسته بندی الزامی است");
    }else if(descController.value.text.isEmpty) {
      PoolinoSnackBar(icon: "close.svg", type: Constants.ERROR).show(context, "توضیحات الزامی است");
    }else {
      IncomeParams costParams = IncomeParams(priceController.text, date, category, descController.text);
      BlocProvider.of<AddIncomeBloc>(context).add(LoadAddIncomeEvent(costParams));
    }
  }
}

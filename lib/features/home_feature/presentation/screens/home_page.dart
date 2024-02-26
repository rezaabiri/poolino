import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poolino/common/utils/poolino_colors.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/features/add_feature/presentation/screens/add_container_page.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/presentation/bloc/user_bloc.dart';
import 'package:poolino/features/card_feature/presentation/bloc/user_status.dart';

import '../../../../common/utils/constants.dart';
import '../../../../common/utils/loading_screen.dart';
import '../../../../common/utils/prefs_opreator.dart';
import '../../../../common/utils/utils.dart';
import '../../../../locator.dart';
import '../widgets/bottom_sheets/add_cost.dart';
import '../widgets/button_widget.dart';
import '../widgets/card_money.dart';
import '../widgets/toolbar_widget.dart';
import '../widgets/transaction_widget.dart';
import 'income_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int hexToInteger(String hex) => int.parse(hex, radix: 16);
  late final TabController _tabController;
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  String extracted = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PrefsOperator prefsOperator = locator<PrefsOperator>();

    var theme = Theme.of(context);
    List<String> prices = [
      "1,230,000",
      "3,400,200",
      "500,000",
      "4,103,000",
      "8,000,000",
      "2,300,000"
    ];
    List<String> titles = [
      "خرید طلای آبشده",
      "پروژه برنامه نویسی",
      "هارد لپ تاپ",
      "مانیتور 27 سامسونگ",
      "لپ تاپ استوک",
      "رم 16 گیگ پی سی"
    ];
    List<int> states = [1, 2, 1, 1, 2, 2];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ToolbarWidget(
                onTap: () {},
              ),
              const SizedBox(
                height: 18,
              ),
              CardMoney(
                cost: "15,000,330",
                income: "23,000,000",
                total: "120,000,000",
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<UserBloc, UserState>(
                    listenWhen: (previous, current) {
                      if (current.userStatus is UserComplete) {
                        return true;
                      }if (current.userStatus is UserLoading) {
                        return true;
                      }

                      return false;
                    },
                    listener: (context, state) {
                      if (state.userStatus is UserLoading) {
                        LoadingScreen.show(context: context);
                      }
                      if (state.userStatus is UserComplete) {
                        LoadingScreen.hide(context);
                      }
                    },
                    builder: (context, state) {
                      if (state.userStatus is UserComplete) {
                        UserComplete userComplete = state
                            .userStatus as UserComplete;
                        UserEntity userEntity = userComplete.userEntity;
                        print(userEntity.result!.updatedAt);

                      }
                      if(state.userStatus is UserError) {
                        UserError u = state.userStatus as UserError;
                        PoolinoSnackBar(icon: Icons.error_outline, type: Constants.ERROR).show(context, u.message);
                      }

                      return ButtonWidget(
                        name: "گزارش حساب",
                        icon: "report_blue",
                        onTap: () {
                          BlocProvider.of<UserBloc>(context).add(LoadUserEvent("09150575854"));
                          },
                      );
                      },
                  ),
                  ButtonWidget(
                    name: "ثبت درآمد",
                    icon: "income_blue",
                    onTap: () {
                      requestPermission();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("ثبت درآمد"),),
                      );
                    },
                  ),
                  ButtonWidget(
                    name: "ثبت هزینه",
                    icon: "cost_blue",
                    onTap: () {
                      AddCost add = AddCost();
                      add.showModal(
                        context,
                        onTapChoose: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/add_container");
                          //Navigator.pop(context);
                        },
                        onTapCustom: () async {
                         // Navigator.pop(context);

                         // Navigator.pushNamed(context, "/add_container");

                          var permission = await Permission.sms.status;
                          if(permission.isGranted){
                            final messages = await _query.querySms(
                              kinds: [
                                SmsQueryKind.inbox,
                                SmsQueryKind.sent,
                              ],
                              address: '9830008528',
                              count: 10,
                            );

                            setState(() => _messages = messages);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/all_transaction");
                    },
                    child: Text(
                      "مشاهده همه (${states.length})",
                      style: const TextStyle(
                          fontFamily: "regular",
                          fontSize: 16,
                          color: Colors.blue
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "تراکنش های اخیر",
                        style: TextStyle(
                            fontFamily: "regular",
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 8,),
                      SvgPicture.asset("assets/images/chart.svg",),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                decoration: BoxDecoration(
                  color: PoolinoColors.f7Color,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.40,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    shrinkWrap: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      if(index ==  _messages.length - 1){
                        return TransactionWidget(
                          price: Utils.getPrice(_messages[index].body.toString()),
                          title: "مشخص نشده",
                          date: _messages[index].date.toString(),
                          state: 0,
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    AddContainerPage(priceText: Utils.getPrice(_messages[index].body.toString()),)));
                          },
                        );
                      }
                      return TransactionWidget(
                        price: Utils.getPrice(_messages[index].body.toString()),
                        title: "مشخص نشده",
                        date: _messages[index].date.toString(),
                        state: 1,
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  AddContainerPage(priceText: Utils.getPrice(_messages[index].body.toString()),)));
                          },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> requestPermission() async {
  const permission = Permission.sms;

  if (await permission.isDenied) {
    await permission.request();
  }
}


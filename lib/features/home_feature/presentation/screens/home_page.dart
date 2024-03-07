import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poolino/common/utils/poolino_colors.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/features/add_feature/presentation/screens/add_container_page.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/main.dart';

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
import 'package:telephony/telephony.dart';
import  'package:persian_number_utility/persian_number_utility.dart';



backgroundMessageHandler(SmsMessage message) async {
  print(message.body.toString()+"hello");
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int hexToInteger(String hex) => int.parse(hex, radix: 16);
  late final TabController _tabController;
  List<SmsMessage> _messages = [];
  String extracted = "";
  String sms = "";
  Telephony telephony = Telephony.instance;

  @override
  void initState() {

    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print(message.address); //+977981******67, sender nubmer
        print(message.body); //sms text
        print(message.date); //1659690242000, timestamp
        setState(() {
          sms = message.body.toString();
        });
      },
      listenInBackground: true,
      onBackgroundMessage: backgroundMessageHandler

    );
    _loadMessages();

    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _loadMessages() async {
    List<String> numbers = ['09810008528', '9830009417'];
    List<SmsMessage> allMessages = [];
    for (String number in numbers) {
      List<SmsMessage> messages = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE],
        filter: SmsFilter.where(SmsColumn.ADDRESS).equals(number),
        sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
      );
      allMessages.addAll(messages);
    }
    setState(() {
      //_messages = allMessages;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PrefsOperator prefsOperator = locator<PrefsOperator>();

    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text("پولینو"),
        titleTextStyle: TextStyle(fontSize: 22, color: PoolinoColors.baseColor, fontFamily: 'medium'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, bottom: 4),
              child: ToolbarWidget(onTap: (){

                }, icon: "user.svg",
              ),
            );
          }
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 8),
            child: Builder(
              builder: (context) {
                return ToolbarWidget(icon:"menu.svg",onTap: (){
                  Scaffold.of(context).openEndDrawer();
                });
              }
            ),
          ),

        ],

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                ButtonWidget(
                  name: "گزارش حساب",
                  icon: "report_account",
                  onTap: () {
                    // BlocProvider.of<AddBloc>(context).add(LoadUserEvent("09150575854"));
                  },
                ),
                ButtonWidget(
                  name: "ثبت درآمد",
                  icon: "card_receive_blue",
                  onTap: () async {
                    requestPermission();

                    ScaffoldMessenger.of(context)
                        .showSnackBar( SnackBar(content: Text("permissionsGranted.toString()"),),
                    );
                  },
                ),
                ButtonWidget(
                  name: "ثبت هزینه",
                  icon: "card_send_blue",
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

                       /* var permission = await Permission.sms.status;
                        if(permission.isGranted){
                          final messages = await _query.querySms(
                            kinds: [
                              SmsQueryKind.inbox,
                            ],
                            address: '9830008528',

                            count: 10,
                          );

                          //setState(() => _messages = messages);
                        }*/
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
                    "مشاهده همه (${16})",
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
                    SvgPicture.asset("assets/images/diagram.svg",),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              decoration: BoxDecoration(
                color: PoolinoColors.f0Color,
                borderRadius: BorderRadius.circular(20)
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.40,
                width: MediaQuery.of(context).size.width,
                child: Builder(
                  builder: (context) {
                    if(_messages.isEmpty){
                      return Icon(Icons.hourglass_empty, color: Colors.red,);
                    }
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      shrinkWrap: true,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                       /* if(index ==  _messages.length - 1){
                          return TransactionWidget(
                            price: Utils.extractAmount(_messages[index].body.toString()),
                            title: "مشخص نشده",
                            date: Utils.formatDateStr(_messages[index].date!),
                            state: 0,
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      AddContainerPage(priceText: Utils.extractAmount(_messages[index].body.toString()),)));
                            },
                          );
                        }*/
                        return TransactionWidget(
                          price: Utils.extractAmount(_messages[index].body.toString()),
                          title: "مشخص نشده",
                          date: Utils.formatDateStr(_messages[index].date!),
                          state: 1,
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    AddContainerPage(priceText: Utils.extractAmount(_messages[index].body.toString()),)));
                            },
                        );
                      },
                    );
                  }
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> requestPermission() async {
  const permission = Permission.sms;
  //Telephony telephony = Telephony.instance;
  //bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
  //log(permissionsGranted.toString());
  print("permissionsGranted");
  //await telephony.requestPhoneAndSmsPermissions;

  if (await permission.isDenied) {
    await permission.request();
  }
}


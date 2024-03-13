import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:poolino/common/database/helpers/sms_db_helper.dart';
import 'package:poolino/common/utils/poolino_colors.dart';
import 'package:poolino/common/widgets/loading.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/features/add_feature/presentation/screens/add_container_page.dart';
import 'package:telephony/telephony.dart';

import '../../../../common/database/models/sms_db_model.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/utils/prefs_opreator.dart';
import '../../../../common/utils/utils.dart';
import '../../../../locator.dart';
import '../widgets/bottom_sheets/add_cost.dart';
import '../widgets/button_widget.dart';
import '../widgets/card_money.dart';
import '../widgets/toolbar_widget.dart';
import '../widgets/transaction_widget.dart';

backgroundMessageHandler(SmsMessage message) async {
  print("${message.body}hello");
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int hexToInteger(String hex) => int.parse(hex, radix: 16);
  late final TabController _tabController;
  final StreamController<List<SmsMessage>> _messagesStreamController =
      StreamController<List<SmsMessage>>.broadcast();
  Telephony telephony = Telephony.instance;

  late Box<SmsDbModel> smsBox;

  @override
  void initState() {
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          //print(message.address); //+977981******67, sender nubmer
          //print(message.body); //sms text
          //print(message.date); //1659690242000, timestamp
        },
        listenInBackground: true,
        onBackgroundMessage: backgroundMessageHandler);
    smsBox = Hive.box<SmsDbModel>('sms_box');
    //List<SmsDbModel> model = smsBox.values.first;//get all items in list
    //print(model);
    _loadMessages();
    requestPermission(context);
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _loadMessages() async {
    //List<SmsDbModel>? models = await dbHelper.getSMS();
    //print(models![0].smsBody);

    List<String> numbers = ['09810008528', '9830009417'];
    List<SmsMessage> allMessages = [];
    for (String number in numbers) {
      try {
        List<SmsMessage> messages = await telephony.getInboxSms(
          columns: [SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE],
          filter: SmsFilter.where(SmsColumn.ADDRESS).equals(number),
          sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
        );
        allMessages.addAll(messages);
      } catch (_) {}
    }
    _messagesStreamController.add(allMessages);

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
      endDrawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text("پولینو"),
        titleTextStyle: TextStyle(
            fontSize: 22, color: PoolinoColors.baseColor, fontFamily: 'medium'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, bottom: 4),
              child: ToolbarWidget(
                onTap: () {},
                icon: "user.svg",
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 8),
            child: Builder(
              builder: (context) {
                return ToolbarWidget(
                  icon: "menu.svg",
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
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
                    requestPermission(context);
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
                  onTap: () {
                    Navigator.pushNamed(context, "/all_transaction");
                  },
                  child: StreamBuilder<List<SmsMessage>>(
                    stream: _messagesStreamController.stream,
                    builder: (context, snapshot) {
                      return Text(
                        "مشاهده همه (${snapshot.data?.length})",
                        style: const TextStyle(
                            fontFamily: "regular",
                            fontSize: 16,
                            color: Colors.blue),
                      );
                    },
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
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(
                      "assets/images/diagram.svg",
                    ),
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
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<List<SmsMessage>>(
                  stream: _messagesStreamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<SmsMessage> messages = snapshot.data!;
                      insert2(messages, smsBox);
                      return list(messages, smsBox);
                    } else if (snapshot.hasError) {
                      return const Text('خطا در دریافت داده‌ها');
                    } else {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Loading(),
                        ],
                      );
                    }
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
    );
  }
}

Future<void> requestPermission(context) async {
  const permission = Permission.sms;
  try {
    Telephony telephony = Telephony.instance;
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    await telephony.requestPhoneAndSmsPermissions;
  } catch (e) {
    print(e);
    PoolinoSnackBar(type: Constants.ERROR, icon: "close.svg")
        .show(context, "دسترسی پیامک الزامی است");
  }
}


Widget list(List<SmsMessage> smsList, Box<SmsDbModel> smsBox) {
  if (smsList.isNotEmpty) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      shrinkWrap: true,
      itemCount: smsBox.length,
      itemBuilder: (context, index) {
        if(smsBox.getAt(index)!.status == 0){
          return TransactionWidget(
            price: Utils.extractAmount(smsBox.getAt(index)!.smsBody.toString())
                .beToman()
                .seRagham(separator: ","),
            title: "مشخص نشده",
            date: Utils.formatDateStr(int.parse(smsBox.getAt(index)!.timestamp)),
            state: 1,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddContainerPage(
                    priceText:
                    Utils.extractAmount(smsBox.getAt(index)!.smsBody.toString()),
                  ),
                ),
              );
            },
          );
        }
        return Text("نداره################");
      },
    );
  }
  return const Center(
    child: Text(
      "پیامکی وجود ندارد!",
      style: TextStyle(fontFamily: "regular", fontSize: 14),
      textDirection: TextDirection.rtl,
    ),
  );
}


Future<void> insert2(
    List<SmsMessage> messages,
    Box<SmsDbModel> smsBox,
    ) async {
  DateTime now = DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month, now.day - 3);
  int yesterdayTimestamp = yesterday.millisecondsSinceEpoch;

  //smsList.clear();
  for (var sms in messages) {
    print(isExists(messages, smsBox) && sms.date! > yesterdayTimestamp);
    if (isExists(messages, smsBox)==false && sms.date! > yesterdayTimestamp) {

      SmsDbModel smsDbModel = SmsDbModel(
          id: "id",
          smsBody: sms.body.toString(),
          sender: sms.address.toString(),
          timestamp: sms.date.toString(),
          status: 0);
      smsBox.delete(smsDbModel);
      smsBox.add(smsDbModel);
      print("inserted");
      //smsList.add(smsDbModel);
    }
    List<SmsDbModel> slist = smsBox.values.toList();
  }
}

bool isExists(List<SmsMessage> messages, Box<SmsDbModel> smsBox){
  bool exists = false;
  DateTime now = DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month, now.day - 2);
  int yesterdayTimestamp = yesterday.millisecondsSinceEpoch;

  for(int i = 0; i < messages.length; ){
    /*if(smsBox.length != 0){
      *//*if(int.parse(smsBox.getAt(i)!.timestamp) != messages[i].date!){
        exists = false;
        return exists;
      }*//*
    }else{
      exists = false;
      return exists;
    }*/
    if(smsBox.getAt(i)!.isInBox == false){
      exists = false;
      return exists;
    }

    exists = true;
    return exists;
  }
  exists = true;
  return exists;
}
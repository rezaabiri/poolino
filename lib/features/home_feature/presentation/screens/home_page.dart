import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poolino/common/widgets/poolino_tabbar.dart';

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
                  ButtonWidget(
                    name: "گزارش حساب",
                    icon: "report_blue",
                    onTap: () {},
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
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("ثبت هزینه انتخابی")));
                          Navigator.pop(context);
                        },
                        onTapCustom: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("ثبت هزینه دستی")));
                          Navigator.pop(context);

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
                  Text(
                    "مشاهده همه (${states.length})",
                    style: const TextStyle(
                        fontFamily: "yekan_bold",
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                  const Text(
                    "تراکنش های اخیر",
                    style: TextStyle(
                        fontFamily: "yekan_bold",
                        fontSize: 16,
                        color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {

                    return TransactionWidget(
                      price: getPrice(_messages[index].body.toString()),
                      title: _messages[index].address.toString(),
                      date: _messages[index].date.toString(),
                      state: _messages[index].body.toString().contains("خرید") ? 1 : 0,

                      onTap: (){
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const IncomePage()));
                      },
                    );
                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
String getPrice(String smsBody) {
  print(smsBody);
  List<String> amounts = [];

  RegExp regex = RegExp(r'(برداشت|واریز|مبلغ|خرید)[:\s]*([-+]?\d{1,15}(?:,\d{3})*(?:\.\d{2})?)');
  Iterable<Match> matches = regex.allMatches(smsBody);

  // چک کردن برای وجود match
  if (matches != null) {
    for (Match match in matches) {
      String word = match.group(1)!;
      String amount = match.group(2)!;
      amounts.add(amount);
    }
  } else {
    return 'تطابق پیدا نشد.';
  }

  if (amounts.isNotEmpty) {
    return amounts.join(', '); // یا هر روش دیگری که برای نمایش لیست مناسب است
  } else {
    return 'تطابق پیدا نشد.';
  }
}



Future<void> requestPermission() async {
  const permission = Permission.sms;

  if (await permission.isDenied) {
    await permission.request();
  }
}


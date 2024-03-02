import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poolino/common/widgets/poolino_appbar.dart';

import '../../../../common/utils/poolino_colors.dart';
import '../../../../common/utils/utils.dart';
import '../widgets/transaction_widget.dart';


class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({super.key});

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {

  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];


  @override
  void initState() {
    super.initState();
    _getMessages();

  }

  _getMessages() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      _messages = await _query.querySms(
        kinds: [
          SmsQueryKind.inbox,
          SmsQueryKind.sent,
        ],
        address: '9830008528',
        count: 10,
      );
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PoolinoAppBar(title: "همه تراکنش های ثبت نشده",
                description: "description",
                icon: "assets/images/card_edit.svg", onTap: (){
              Navigator.pushNamed(context, "/home");
            }),
            const SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                  color: PoolinoColors.f7Color,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    if(index ==  _messages.length - 1){
                      return TransactionWidget(
                        price: Utils.getPrice(_messages[index].body.toString()),
                        title: "مشخص نشده",
                        date: _messages[index].date.toString(),
                        state: 0,
                        onTap: (){
                          //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const IncomePage()));
                        },
                      );
                    }
                    return TransactionWidget(
                      price: Utils.getPrice(_messages[index].body.toString()),
                      title: "مشخص نشده",
                      date: _messages[index].date.toString(),
                      state: 1,
                      onTap: (){
                        //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const IncomePage()));
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

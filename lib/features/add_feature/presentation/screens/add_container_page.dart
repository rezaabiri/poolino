import 'package:flutter/material.dart';
import 'package:poolino/common/widgets/poolino_appbar.dart';
import 'package:poolino/features/add_feature/presentation/screens/add_income_page.dart';

import '../../../../common/widgets/poolino_tabbar.dart';
import 'add_cost_page.dart';

class AddContainerPage extends StatefulWidget {
  AddContainerPage({super.key, this.priceText});
  String? priceText="0";


  @override
  State<AddContainerPage> createState() => _AddContainerPageState();

}

class _AddContainerPageState extends State<AddContainerPage> with TickerProviderStateMixin {
  late final TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60),
      child: PoolinoAppBar(
        title: "ثبت هزینه",
        description: "اطلاعات فرم را تکمیل کنید",
        icon: "assets/images/cost_blue.svg",
        onTap: (){
          Navigator.pop(context);
        },
      )),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                SizedBox(
                  height: 40,
                  child: PoolinoTabBar(
                      tabController: _tabController,
                      tabs: const [
                        Tab(
                          text: "درآمد",
                        ),
                        Tab(
                          text: "هزینه",
                        )
                      ]
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children:[
                      AddCostPage(price: widget.priceText!,),
                      const AddIncomePage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

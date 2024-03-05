import 'package:flutter/material.dart';
import 'package:poolino/common/widgets/poolino_appbar.dart';
import 'package:poolino/features/add_feature/presentation/screens/add_income_page.dart';

import '../../../../common/widgets/poolino_tabbar.dart';
import '../bloc/priority_cubit/priority_cubit.dart';
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(60),
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
                  height: 44,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: PoolinoTabBar(
                      tabController: _tabController,
                      tabs: const [
                        Tab(
                          text: "هزینه",
                        ),
                          Tab(
                            text: "درآمد",
                          ),
                        ],
                      onTap: (index){
                        /*if(index == 0){
                          return const AddIncomePage();
                        }else {
                          return AddCostPage(price: widget.priceText ?? "0",);
                        }*/
                      },
                    ),
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children:[
                      AddCostPage(price: widget.priceText ?? "0",),
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

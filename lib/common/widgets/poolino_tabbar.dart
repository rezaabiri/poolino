import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../features/home_feature/screens/income_page.dart';
import '../../features/home_feature/widgets/transaction_widget.dart';

class PoolinoTabBar<T> extends StatelessWidget {
  TabController tabController;
  List<Tab> tabs;

  PoolinoTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DefaultTabController(
        length: tabs.length,
        child: TabBar(
            controller: tabController,
            unselectedLabelStyle: const TextStyle(
              fontFamily: "yekan_regular",
            ),
            unselectedLabelColor: Colors.black,
            overlayColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade400),
            splashBorderRadius: BorderRadius.circular(12),
            labelStyle: TextStyle(fontFamily: "yekan_regular"),
            tabAlignment: TabAlignment.fill,
            automaticIndicatorColorAdjustment: false,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: hexToColor(Constants.baseColor),
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: (int index) {},
            tabs: tabs),
      ),
    );
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

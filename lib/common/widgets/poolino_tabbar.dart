import 'package:flutter/material.dart';
import 'package:poolino/common/utils/poolino_colors.dart';


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
      decoration: ShapeDecoration(
        color: PoolinoColors.f0Color,
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        )
      ),
      child: DefaultTabController(
        length: tabs.length,
        child: TabBar(
            controller: tabController,
            unselectedLabelStyle: const TextStyle(
              fontFamily: "regular",
            ),
            unselectedLabelColor: Colors.black,
            splashBorderRadius: BorderRadius.circular(12),
            labelStyle: const TextStyle(fontFamily: "regular"),
            tabAlignment: TabAlignment.fill,
            automaticIndicatorColorAdjustment: false,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: ShapeDecoration(
              color: PoolinoColors.baseColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              )
            ),
            onTap: (int index) {},
            tabs: tabs),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poolino/common/poolino_colors.dart';
import 'package:figma_squircle/figma_squircle.dart';


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
        color: Colors.grey.shade200,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: DefaultTabController(
        length: tabs.length,
        child: TabBar(
            controller: tabController,
            unselectedLabelStyle: const TextStyle(
              fontFamily: "regular",
            ),
            unselectedLabelColor: Colors.black,
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade400),
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
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 12,
                  cornerSmoothing: 1,
                ),
              ),
            ),
            onTap: (int index) {},
            tabs: tabs),
      ),
    );
  }
}

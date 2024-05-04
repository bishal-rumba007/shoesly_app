



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({
    super.key,
    required TabController tabController,
    required this.tabBarItems,
  }) : _tabController = tabController;
  final TabController _tabController;
  final List<String> tabBarItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabs: tabBarItems.map((brand) => Tab(text: brand)).toList(),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide.none,
        ),
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

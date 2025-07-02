import 'package:flutter/material.dart';

class ResponsiveNavigation extends StatelessWidget {
  const ResponsiveNavigation({
    required this.currentIndex,
    required this.onTabChanged,
    required this.tabs,
    required this.tabController,
    super.key,
  });

  final int currentIndex;
  final Function(int) onTabChanged;
  final List<String> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) => TabBar(
        controller: tabController,
        onTap: onTabChanged,
        tabs: tabs.map((String tab) => Tab(text: tab)).toList(),
      );
}

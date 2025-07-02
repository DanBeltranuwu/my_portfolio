import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'widgets/responsive_navigation.dart';
import 'widgets/social_bottom_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme.lightTheme,
        home: const PortfolioTabs(),
        debugShowCheckedModeBanner: false,
      );
}

class PortfolioTabs extends StatefulWidget {
  const PortfolioTabs({super.key});

  @override
  State<PortfolioTabs> createState() => _PortfolioTabsState();
}

class _PortfolioTabsState extends State<PortfolioTabs>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final TabController _tabController;
  int _currentIndex = 0;

  final List<String> _tabs = <String>[
    'Home',
    'Projects',
    'Experience',
    'Contact',
  ];
  final List<Widget> _sections = <Widget>[
    const AboutSection(),
    const ProjectsSection(),
    const ExperienceSection(),
    const ContactSection(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    _tabController.animateTo(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _tabs.asMap().entries.map((MapEntry<int, String> entry) {
            int index = entry.key;
            String tab = entry.value;
            bool isSelected = index == _currentIndex;

            return ListTile(
              title: Text(
                tab,
                style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).tabBarTheme.labelColor
                      : Theme.of(context).tabBarTheme.unselectedLabelColor,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              leading: Icon(
                _getTabIcon(index),
                color: isSelected
                    ? Theme.of(context).tabBarTheme.labelColor
                    : Theme.of(context).tabBarTheme.unselectedLabelColor,
              ),
              onTap: () {
                _onTabChanged(index);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  IconData _getTabIcon(int index) {
    switch (index) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.work;
      case 2:
        return Icons.timeline;
      case 3:
        return Icons.contact_mail;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Daniel Beltrán Portfolio'),
        actions: <Widget>[
          if (screenWidth < 600)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _showMobileMenu(context),
            ),
        ],
        bottom: screenWidth >= 600
            ? PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: ResponsiveNavigation(
                  currentIndex: _currentIndex,
                  onTabChanged: _onTabChanged,
                  tabs: _tabs,
                  tabController: _tabController,
                ),
              )
            : null,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _sections,
      ),
      bottomNavigationBar: const SocialBottomBar(),
    );
  }
}

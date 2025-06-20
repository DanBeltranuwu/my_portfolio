import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme.lightTheme,
        home: const PortfolioTabs(),
        debugShowCheckedModeBanner: false,
      );
}

class PortfolioTabs extends StatelessWidget {
  const PortfolioTabs({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My Portfolio'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'About'),
                Tab(text: 'Projects'),
                Tab(text: 'Experience'),
                Tab(text: 'Contact'),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              AboutSection(),
              ProjectsSection(),
              ExperienceSection(),
              ContactSection(),
            ],
          ),
        ),
      );
}

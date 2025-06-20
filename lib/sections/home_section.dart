import 'package:flutter/material.dart';

import 'about_section.dart';
import 'contact_section.dart';
import 'experience_section.dart';
import 'projects_section.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AboutSection(),
              SizedBox(height: 32),
              ProjectsSection(),
              SizedBox(height: 32),
              ExperienceSection(),
              SizedBox(height: 32),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
}

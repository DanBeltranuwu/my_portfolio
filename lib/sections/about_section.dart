import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) => const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(title: 'About Me'),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text('This is the about section. Add your bio here.'),
        ),
      ],
    );
}

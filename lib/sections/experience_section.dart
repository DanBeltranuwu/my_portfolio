import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) => const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(title: 'Experience'),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
              'This is the experience section. Add your work history here.',),
        ),
      ],
    );
}

import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) => const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(title: 'Contact'),
        Padding(
          padding: EdgeInsets.all(8),
          child:
              Text('This is the contact section. Add your contact info here.'),
        ),
      ],
    );
}

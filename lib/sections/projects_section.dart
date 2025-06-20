import 'package:flutter/material.dart';

import '../data/projects.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionTitle(title: 'Projects'),
          ...projects.map((Project project) => ProjectCard(project: project)),
        ],
      );
}

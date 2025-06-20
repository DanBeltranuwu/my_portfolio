import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project, super.key});
  final Project project;

  @override
  Widget build(BuildContext context) => Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(project.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(project.title,
                style: Theme.of(context).textTheme.headlineLarge,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(project.description),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Open project link
                },
                child: const Text('View'),
              ),
            ],
          ),
        ],
      ),
    );
}

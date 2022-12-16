import 'package:flutter/material.dart';
import 'package:flutter_website/data/project_data.dart';
import 'package:flutter_website/models/project.dart';

class ProjectList with ChangeNotifier {
  final List<Project> _listProject = projectsData;

  List<Project> get listProject => [..._listProject];

  int itemCount() {
    return listProject.length;
  }
}

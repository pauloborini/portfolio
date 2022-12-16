import 'package:flutter/material.dart';

class Project with ChangeNotifier {
  final String name;
  final String link;
  final String image;

  Project({required this.name, required this.link, required this.image});
}

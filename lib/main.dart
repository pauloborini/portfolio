import 'package:flutter/material.dart';
import 'package:flutter_website/pages/home_page.dart';
import 'package:flutter_website/providers/project_list.dart';
import 'package:provider/provider.dart';

import 'components/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProjectList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio Paulo',
        theme: ThemeData(
            brightness: Brightness.dark,
            backgroundColor: darkModeColor,
            primaryColor: primaryColor,
            fontFamily: 'Login'),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
        },
      ),
    );
  }
}

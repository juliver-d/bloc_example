import 'package:bloc_demo/config/theme.dart';
import 'package:bloc_demo/config/route.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      theme: JLTheme.of(context),
      routes: JLRoutes.routes,
      initialRoute: JLRoutes.initialRoute,
    );
  }
}
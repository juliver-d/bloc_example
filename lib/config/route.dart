import 'package:bloc_demo/page/form/form_page.dart';
import 'package:bloc_demo/page/home/home_page.dart';
import 'package:flutter/material.dart';

class JLRoutes {
  static const home = '/';
  static const form = 'form';

  static final String initialRoute = JLRoutes.home;

  static final Map<String, WidgetBuilder> routes = {
    JLRoutes.home: (ctx) => HomePage(),
    JLRoutes.form: (ctx) => FormPage()
  };

}


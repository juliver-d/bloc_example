import 'package:bloc_demo/config/route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bloc example'),),
      body: Container(
        child: Center(
          child: FlatButton(
            color: Colors.red,
            child: Text('go form'),
            onPressed: () => Navigator.of(context).pushNamed(JLRoutes.form)
          ),
        ),
      ),
    );
  }
}

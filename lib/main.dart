import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgetTest.dart';
import 'package:flutter_app/first_page.dart';
import 'package:flutter_app/second_page.dart';
import 'package:flutter_app/GlobalVariable.dart';
import 'package:flutter_app/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Flutter Demo',
      theme : ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}



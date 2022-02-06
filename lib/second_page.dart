import 'package:flutter/material.dart';
import 'package:flutter_app/first_page.dart';
import 'package:flutter_app/person.dart';
import 'package:flutter_app/GlobalVariable.dart';

class SecondPage extends StatelessWidget {
  final Person person;

  SecondPage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: RaisedButton(
        child: Text('Previous page'),
        onPressed: () {
          Navigator.pop(context, 'ok');	//인자를 넘겨줌, 넘겨주지 않으면 null 참조 에러남
        },
      ),
    );
  }
}
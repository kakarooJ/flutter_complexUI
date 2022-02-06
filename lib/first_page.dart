import 'package:flutter/material.dart';
import 'package:flutter_app/second_page.dart';
import 'package:flutter_app/person.dart';
import 'package:flutter_app/GlobalVariable.dart';



class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: RaisedButton(
        child: Text('Next page'),
        onPressed: () async {
          final person = Person('넥슨지티', 142);
          final result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => SecondPage(person: person))
          );

          firstPageDialog(result);
        },
      ),
    );
  }

  void firstPageDialog(String result) {
    showDialog(
        context: GlobalVariable.naviagatorState.currentContext as BuildContext,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("Dialog Title"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  result,
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

class WidgetTest extends StatefulWidget {
  const WidgetTest({Key? key}) : super(key: key);

  @override
  _WidgetTestState createState() => _WidgetTestState();
}

enum Gender { MAN, WOMAN }
Gender _gender = Gender.MAN;

final _valueList = ['김정현','SK','김성준','김여진'];
var _selectedValue = '김정현';

class _WidgetTestState extends State<WidgetTest> {

  var _isChecked = false;
  var _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox/Radio/Switch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              title: Text('Man'),
              //leading: Radio(
              value: Gender.MAN,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value as Gender;
                });
              },
              //),
            ),
            RadioListTile(
              title: Text('Woman'),
              //leading: Radio(
              value: Gender.WOMAN,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value as Gender;
                });
              },
              //),
            ),
            DropdownButton(
              value: _selectedValue,
              items: _valueList.map((value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as String;
                });
              },
            ),
            CheckboxListTile(
              subtitle: Text('subTitle'),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('CheckBox'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.black,
            ),
            CheckboxListTile(
              subtitle: Text('subTitle'),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('CheckBox'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              subtitle: Text('subTitle'),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('CheckBox'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            InkWell(
              onTap: () {

              },
              child: Text('click me'),
            ),
            GestureDetector(
                onTap: () {
                  final random = Random();
                  setState(() {
                    _size = random.nextInt(200).toDouble() + 100;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds:1),
                  width: _size,
                  height: _size,
                  child: Image.asset('assets/sample.jpg'),
                  curve:Curves.fastOutSlowIn,
                )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.eleven_mp),
        onPressed: () => FlutterDialog(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void FlutterDialog() {
    showDialog(
        context: context,
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
                  "Dialog Content",
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
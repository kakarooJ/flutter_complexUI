import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/second_page.dart';
import 'package:flutter_app/person.dart';
import 'package:flutter_app/GlobalVariable.dart';
import 'dart:developer';

final imgItems = [
  'assets/list1.jpg',
  'assets/list2.jpg',
  'assets/list3.jpg',
  'assets/list4.jpg',
  'assets/list5.jpg',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;
  var _pages = [Page1(), Page2(), Page3()];
  final _listItems = List.generate(20, (i) => ListTile(title: Text('No.$i')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '복잡한 UI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('add');
            },
          ),
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('이용서비스'),
            icon: Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            title: Text('내정보'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Column or Row 위젯은 화면크기를 벗어나는 UI는 작성불가,
    //아래 children 위젯이 화면크기를 벗어나게 되면 '공사중'이 표시됨
    //스크롤이 필요하면 ListView로변경하거나 Column을 SingleChildScrollView로 감싸는 방법이 있다.
    return ListView(//)Column(  //or ListView
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //위젯사이의 공간을 동일한 비율로 정렬
            children: [
              GestureDetector(
                onTap: () {
                  print('click1');
                },
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('click2');
                },
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('click3');
                },
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('click4');
                },
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //위젯사이의 공간을 동일한 비율로 정렬
            children: [
              GestureDetector(
                onTap: () {
                  print('click5');
                },
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('click6');
                },
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('click7');
                },
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: [
                    Icon(Icons.local_taxi, size: 40),
                    Text('Top'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle() {
    //좌우로 슬라이드 되는 광고를 구성, PageView 위젯을 사용해도 되지만,
    //carousel_slider 라이브러리를 사용하면 자동 스크롤 지원 기능등이 지원되어 훨씬 유용하게 사용가능
    //pub.dev 웹사이트에서 다양한 라이브러리 검색 가능
    //dependencies: //추가
    //    carousel_slider: ^1.3.1
    return CarouselSlider(
      height: 400.0,
      autoPlay: true,
      items: imgItems.map((item) {    //5 페이지
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery //기기의 정보를 얻는 클래스
                    .of(context)
                    .size
                    .width, //기기의 가로 길이
                margin: EdgeInsets.symmetric(horizontal: 5.0),  //좌우 여백 5
                decoration: BoxDecoration(
                    color: Colors.amber   //배경색
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                      item,   //image name
                      fit: BoxFit.cover
                  ),
                ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (index) {
      return ListTile(
        leading:Icon(Icons.notifications_none),
        title:Text('이것은 공지사항입니다'),
      );
    });

    return ListView(
        physics: NeverScrollableScrollPhysics(),//이 리스트의 스크롤 동작금지
        shrinkWrap: true, //스크롤 가능한 객체안에 다시 스크롤 객체를 넣는 경우 shrinkWrap 을 true로 설정해야 한다.
        children: items,
    );

  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '이용서비스',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '내정보',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

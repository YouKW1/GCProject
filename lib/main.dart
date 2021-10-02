/*
//////////////////////////////////////////////////////////////////////////////// 1. import 부분

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//////////////////////////////////////////////////////////////////////////////// 2. main() 부분 > 실제 플러터 어플리케이션의 시작이라 할 수 있는 <위젯>을 호출하는 역할만 수행하고 있습니다.

void main() => runApp(MyApp9());

//////////////////////////////////////////////////////////////////////////////// 3. MyApp 클래스 StatelessWidget 부분 > MyApp 이라는 클래스가 StatelessWidget 을 상속받아 생성

class MyApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVENT CYCLE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////// 4. HomePage 클래스 StatefulWidget 부분

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//////////////////////////////////////////////////////////////////////////////// 5. _HomePageState 클래스 State<HomePage> 부분

class _HomePageState extends State<HomePage> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EVENT CYCLE'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toIso8601String());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            )
          ],
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_calendar/page/page0.dart';
import 'package:flutter_calendar/page/page1.dart';
import 'package:flutter_calendar/page/page2.dart';
import 'package:flutter_calendar/page/page3.dart';

/*
import 'package:flutter_calendar/page/page2.dart';
import 'package:flutter_calendar/page/page1.dart';
import 'package:flutter_calendar/page/page3.dart';
import 'package:flutter_calendar/page/page0.dart';
*/

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {

  @override

  _BottomNavBarState createState() => _BottomNavBarState();

}

class _BottomNavBarState extends State<BottomNavBar> {


  int pageIndex = 0;
  //모든 페이지
  final page0 _listpage0 = page0();
  final page1 _listpage1 = page1();
  final page2 _listpage2 = page2();
  final page3 _listpage3 = page3();


  Widget _showPage = new page0();
  Widget _pageChooser(int page){
    switch (page) {
      case 0:
        return _listpage0;
        break;
      case 1:
        return _listpage1;
        break;
      case 2:
        return _listpage2;
        break;
      case 3:
        return _listpage3;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
                'NoNONo.'
            //style: new TextStyle(fontSize: 30)
            ),
          ),
        );
    }
  }
//  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

/*
  final screens = [
    MyApp0(),
    MyApp1(),
    MyApp2(),
    MyApp3(),
  ];
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: CurvedNavigationBar(

          //initialIndex: pageIndex,
         // key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.calendar_today, size: 25),
            Icon(Icons.calendar_view_week_rounded, size: 25),
            Icon(Icons.access_alarm_sharp, size: 25),
            Icon(Icons.menu, size: 25),
          ],
          color: Colors.black26,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 450),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(//screens[index]
    color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
    ));
  }
}
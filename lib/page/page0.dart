
//////////////////////////////////////////////////////////////////////////////// 1. import 부분

//////////////////////////////////////////////////////////////////////////////// 2. main() 부분 > 실제 플러터 어플리케이션의 시작이라 할 수 있는 <위젯>을 호출하는 역할만 수행하고 있습니다.

/*
void main() {
  runApp(const MyApp3());
}
*/

//////////////////////////////////////////////////////////////////////////////// 3. MyApp 클래스 StatelessWidget 부분 > MyApp 이라는 클래스가 StatelessWidget 을 상속받아 생성


//////////////////////////////////////////////////////////////////////////////// 1. import 부분

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//////////////////////////////////////////////////////////////////////////////// 2. main() 부분 > 실제 플러터 어플리케이션의 시작이라 할 수 있는 <위젯>을 호출하는 역할만 수행하고 있습니다.

void main() => runApp(page0());

//////////////////////////////////////////////////////////////////////////////// 3. MyApp 클래스 StatelessWidget 부분 > MyApp 이라는 클래스가 StatelessWidget 을 상속받아 생성

class page0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVENT CYCLE',
      debugShowCheckedModeBanner: false,
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
              initialCalendarFormat: CalendarFormat.month,
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
import 'package:PomodoroTimer/screens/list_history.dart';
import 'package:flutter/material.dart';
import 'widget/pomodoro_timer.dart';

class PomodoroApp extends StatefulWidget {
  const PomodoroApp({Key? key}) : super(key: key);

  @override
  State<PomodoroApp> createState() => _PomodoroAppState();
}

class _PomodoroAppState extends State<PomodoroApp> {
  int _tabActive = 0;

  static List<Widget> pages = <Widget>[PomodoroTimer(), const ListHistory()];

  void _changeTabActive(int index) {
    setState(() {
      _tabActive = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages.elementAt(_tabActive),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabActive,
            onTap: _changeTabActive,
            // backgroundColor: Color(Colors.),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm_rounded),
                label: 'Timer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                label: 'About',
              ),
            ]),
      ),
      theme: ThemeData.light(),
    );
  }
}

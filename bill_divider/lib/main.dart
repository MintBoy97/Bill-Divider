import 'package:flutter/material.dart';
import 'info_widget.dart';
import 'bills_list.dart';
import 'bills_history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  int _currentIndex;
  List<Widget> _children;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    _children = [
      BillsList(),
      BillsHistory(),
      InfoWidget(),
    ];

    print("Init State MyApp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Bill Divider"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Bills"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info"
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print("Update State MyApp");
    });
  }
}
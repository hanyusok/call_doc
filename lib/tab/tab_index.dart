import 'package:call_doc/tab/tab_desk.dart';
import 'package:call_doc/tab/tab_home.dart';
import 'package:call_doc/tab/tab_list.dart';
import 'package:call_doc/tab/tab_profile.dart';
import 'package:flutter/material.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({super.key});

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {
  int _currentIndex = 0;
  List<Widget> _tabs = [
    TabHome(),
    TabList(),
    TabDesk(),
    TabProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 38,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: '콜닥'),
            BottomNavigationBarItem(
                icon: Icon(Icons.woman_outlined), label: '접수'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
          ]),
    );
  }
}

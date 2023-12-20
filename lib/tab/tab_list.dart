import 'package:flutter/material.dart';

class TabList extends StatefulWidget {
  const TabList({super.key});

  @override
  State<TabList> createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('콜닥 리스트 LIST'));
  }
}

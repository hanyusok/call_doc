import 'package:flutter/material.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('비대면 안내사항 유의점'),
    );
  }
}

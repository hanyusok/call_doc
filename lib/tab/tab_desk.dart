import 'package:flutter/material.dart';

class TabDesk extends StatefulWidget {
  const TabDesk({super.key});

  @override
  State<TabDesk> createState() => _TabDeskState();
}

class _TabDeskState extends State<TabDesk> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('접수 데스크'),
    );
  }
}

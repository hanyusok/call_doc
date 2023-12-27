import 'package:call_doc/controllers/auth_services.dart';
// import 'package:call_doc/controllers/customer_services.dart';
import 'package:call_doc/tab/tab_desk.dart';
import 'package:call_doc/tab/tab_home.dart';
import 'package:call_doc/tab/tab_list.dart';
import 'package:call_doc/tab/tab_profile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({super.key});

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {
  // late Stream<QuerySnapshot> _stream;
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const TabHome(),
    const TabList(),
    const TabDesk(),
    const TabProfile(),
  ];

  @override
  void initState() {
    // _stream = CustomerService().getCustomers();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('마트의원'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.family_restroom_outlined)),
          PopupMenuButton<Text>(itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text("메뉴1")),
              const PopupMenuItem(child: Text("메뉴2")),
              const PopupMenuItem(child: Text("메뉴3")),
            ];
          })
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          iconSize: 38,
          selectedItemColor: Colors.purple.shade200,
          unselectedItemColor: Colors.grey.shade400,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks_sharp), label: '콜닥'),
            BottomNavigationBarItem(
                icon: Icon(Icons.support_agent_outlined), label: '알림'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
          ]),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 32,
                  child: Text(FirebaseAuth.instance.currentUser!.email
                      .toString()[0]
                      .toUpperCase()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(FirebaseAuth.instance.currentUser!.email.toString()),
              ],
            )),
            ListTile(
              leading: const Icon(Icons.power_off_outlined),
              title: const Text("사용자 설정"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.power_off_outlined),
              title: const Text("가족추가"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.power_off_outlined),
              title: const Text("처방전 설정"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.power_off_outlined),
              title: const Text("알림 설정"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.power_off_outlined),
              title: const Text("계정 삭제"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined),
              title: const Text("Logout"),
              onTap: () {
                AuthService().logout();
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Logged out!')));
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

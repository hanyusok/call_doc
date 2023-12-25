import 'package:call_doc/controllers/user_services.dart';
import 'package:call_doc/tab/update_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    _stream = UserService().getUsers();
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
        title: const Text("설정"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong!');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('Loading...'),
              );
            }
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/profile.png",
                            height: 220,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 220,
                            height: 220,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  FirebaseAuth.instance.currentUser!.email
                                      .toString(),
                                  style: const TextStyle(fontSize: 32),
                                ),
                                const Text(
                                  "공도읍 거주",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                          'assets/images/email.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child:
                                          Image.asset('assets/images/call.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                          'assets/images/video_call.png'),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      snapshot.data!.docs
                                          .map((DocumentSnapshot document) {
                                            Map<String, dynamic> data =
                                                document.data()!
                                                    as Map<String, dynamic>;
                                          })
                                          .toList()
                                          .cast();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => UpdateUser(
                                                    name: data["name"],
                                                    address: data["address"],
                                                    phone: data["phone"],
                                                    birthdate:
                                                        data["birthdate"],
                                                  )));
                                    },
                                    child: const Text("수정하기"))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      const Text(
                        "About",
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/images/mappin.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: const Text(
                                    "안성시 공도읍 양기리 1234",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/images/clock.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "가족 구성원",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: const Text(
                                    "박찬호",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/map.png",
                        width: 180,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "비대면 history",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Image.asset("assets/images/list.png"),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      130,
                                  child: const Text(
                                    "List Histories",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ),
            );
          }),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  @override
  Widget build(BuildContext context) {
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
                Container(
                  width: MediaQuery.of(context).size.width - 220,
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "홍길동",
                        style: TextStyle(fontSize: 32),
                      ),
                      const Text(
                        "공도읍 거주",
                        style: TextStyle(fontSize: 19, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/images/email.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/images/call.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/images/video_call.png'),
                          ),
                        ],
                      ),
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
                          color: Colors.black87.withOpacity(0.7), fontSize: 20),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width - 268,
                        child: const Text(
                          "안성시 공도읍 양기리 1234",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                          color: Colors.black87.withOpacity(0.7), fontSize: 20),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 268,
                      child: const Text(
                        "박찬호",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Image.asset(
              "assets/images/map.png",
              width: 180,
            )
          ],
        ),
        Text(
          "비대면 기록",
          style: TextStyle(
              color: Colors.blue, fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SizedBox(),
      ),
    );
    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       CircleAvatar(
    //         maxRadius: 32,
    //         child: Text(FirebaseAuth.instance.currentUser!.email
    //             .toString()[0]
    //             .toUpperCase()),
    //       ),
    //       Text(FirebaseAuth.instance.currentUser!.email.toString()),
    //     ],
    //   ),
    // );
  }
}

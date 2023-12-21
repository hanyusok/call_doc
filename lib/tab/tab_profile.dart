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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 32,
            child: Text(FirebaseAuth.instance.currentUser!.email
                .toString()[0]
                .toUpperCase()),
          ),
          Text(FirebaseAuth.instance.currentUser!.email.toString()),
        ],
      ),
    );
  }
}

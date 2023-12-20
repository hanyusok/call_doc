import 'package:call_doc/controllers/call_detail_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class CallDetailPage extends StatefulWidget {
  const CallDetailPage({super.key});

  @override
  State<CallDetailPage> createState() => _CallDetailPageState();
}

class _CallDetailPageState extends State<CallDetailPage> {
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    _stream = CallDetailService().getCallDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마트의원 | 비대면 진료'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading..."),
            );
          }
          return snapshot.data!.docs.isEmpty
              ? const Center(
                  child: Text("No call details found..."),
                )
              : ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ListTile(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => UpdateCustomer(
                            //           docID: document.id,
                            //           name: data["name"],
                            //           phone: data["phone"],
                            //           birthdate: data["birthdate"])))
                          },
                          leading: CircleAvatar(child: Text(data["sender"][0])),
                          title: Text(data["sender"]),
                          subtitle: Text(data["memo"]),
                          trailing: IconButton(
                            icon: const Icon(Icons.maps_ugc),
                            onPressed: () {
                              //coding later for kakaotalk link
                            },
                          ),
                        );
                      })
                      .toList()
                      .cast(),
                );
        },
      ),
    );
  }
}

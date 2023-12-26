import 'package:call_doc/controllers/customer_services.dart';
import 'package:call_doc/views/update_customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TabList extends StatefulWidget {
  const TabList({super.key});

  @override
  State<TabList> createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    _stream = CustomerService().getCustomers();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Loading...'),
            );
          }
          return snapshot.data!.docs.isEmpty
              ? const Center(
                  child: Text("no customers found..."),
                )
              : ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateCustomer(
                                            docID: document.id,
                                            name: data["name"],
                                            memo: data["memo"],
                                            phone: data["phone"],
                                            birthdate: data["birthdate"]))),
                                leading:
                                    CircleAvatar(child: Text(data["name"][0])),
                                title: Text(data["memo"]),
                                subtitle: Text(data["createdAt"]),
                                trailing: IconButton(
                                  icon: const Icon(Icons.maps_ugc),
                                  onPressed: () {
                                    //coding later for kakaotalk link
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("자세히")),
                                  TextButton(
                                      onPressed: () {}, child: const Text("신청"))
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      .toList()
                      .cast(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: const Icon(Icons.add_task_outlined),
      ),
    );
  }
}

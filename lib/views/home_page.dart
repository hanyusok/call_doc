import 'package:call_doc/controllers/customer_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<QuerySnapshot> _stream;
  // TextEditingController _searchController = TextEditingController();
  // FocusNode _searchfocusNode = FocusNode();

  @override
  void initState() {
    _stream = CustomerService().getCustomers();
    super.initState();
  }

  @override
  void dispose() {
    // _searchfocusNode.dispose();
    super.dispose();
  }

  searchCustomers(String search) {
    _stream = CustomerService().getCustomers(searchQuery: search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마트의원 | 비대면 진료"),
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
                  child: Text("No customers found..."),
                )
              : ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ListTile(
                          onTap: () {},
                          leading: CircleAvatar(child: Text(data["name"][0])),
                          title: Text(data["name"]),
                          trailing: IconButton(
                            icon: const Icon(Icons.call),
                            onPressed: () {},
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

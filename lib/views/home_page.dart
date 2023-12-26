import 'package:call_doc/controllers/auth_services.dart';
import 'package:call_doc/controllers/customer_services.dart';
import 'package:call_doc/views/update_customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<QuerySnapshot> _stream;
  // final TextEditingController _searchController = TextEditingController();
  // final FocusNode _searchfocusNode = FocusNode();

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
        // bottom: PreferredSize(
        //     preferredSize: Size(MediaQuery.of(context).size.width * 8, 80),
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(vertical: 8),
        //       child: SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.9,
        //         child: TextFormField(
        //           onChanged: (value) => {},
        //           focusNode: _searchfocusNode,
        //           controller: _searchController,
        //           decoration: InputDecoration(
        //               border: const OutlineInputBorder(),
        //               label: const Text("Search"),
        //               prefixIcon: const Icon(Icons.search),
        //               suffixIcon: _searchController.text.isNotEmpty
        //                   ? IconButton(
        //                       onPressed: () {
        //                         _searchController.clear();
        //                         _searchfocusNode.unfocus();
        //                         _stream = CustomerService().getCustomers();
        //                         setState(() {});
        //                       },
        //                       icon: const Icon(Icons.close))
        //                   : null),
        //         ),
        //       ),
        //     )),
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
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateCustomer(
                                      docID: document.id,
                                      name: data["name"],
                                      memo: data["memo"],
                                      phone: data["phone"],
                                      birthdate: data["birthdate"]))),
                          leading: CircleAvatar(child: Text(data["name"][0])),
                          title: Text(data["name"]),
                          subtitle: Text(data["birthdate"]),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: const Icon(Icons.add_task_outlined),
      ),
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
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
              onTap: () {
                AuthService().logout();
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Logged Out.")));
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}

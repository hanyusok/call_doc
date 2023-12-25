import 'package:call_doc/controllers/user_services.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser(
      {super.key,
      // required this.docID,
      required this.name,
      required this.address,
      required this.phone,
      required this.birthdate});

  final String name, address, phone, birthdate;

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController.text = widget.name;
    _phoneController.text = widget.phone;
    _addressController.text = widget.address;
    _birthdateController.text = widget.birthdate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update User"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Enter any name" : null,
                      controller: _nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("name")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("address")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("phone")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _birthdateController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("birthdate")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            UserService().updateUser(
                              _nameController.text,
                              _addressController.text,
                              _phoneController.text,
                              _birthdateController.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                "updated",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.blue.shade400,
                            ));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: OutlinedButton(
                        onPressed: () {
                          // UserService().deleteUser(widget.docID);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                              "deleted",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red.shade400,
                          ));
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

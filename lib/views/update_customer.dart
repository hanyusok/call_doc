import 'package:call_doc/controllers/customer_services.dart';
import 'package:flutter/material.dart';

class UpdateCustomer extends StatefulWidget {
  const UpdateCustomer(
      {super.key,
      required this.docID,
      required this.name,
      required this.memo,
      required this.phone,
      required this.birthdate});

  final String docID, name, memo, phone, birthdate;

  @override
  State<UpdateCustomer> createState() => _UpdateCustomerState();
}

class _UpdateCustomerState extends State<UpdateCustomer> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController.text = widget.name;
    _memoController.text = widget.memo;
    _phoneController.text = widget.phone;
    _birthdateController.text = widget.birthdate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("비대면 내용"),
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
                      validator: (value) => value!.isEmpty ? "입력 필수" : null,
                      controller: _nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("이름")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _memoController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("메모")),
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
                            CustomerService().updateCustomer(
                                _nameController.text,
                                _memoController.text,
                                _phoneController.text,
                                _birthdateController.text,
                                widget.docID);
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
                          CustomerService().deleteCustomer(widget.docID);
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

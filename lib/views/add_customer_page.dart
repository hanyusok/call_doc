import 'package:call_doc/controllers/customer_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("신청")),
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
                    validator: (value) =>
                        value!.isEmpty ? "Enter any phone" : null,
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
                    validator: (value) =>
                        value!.isEmpty ? "Enter any phone" : null,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("phone")),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Enter any phone" : null,
                    controller: _birthdateController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("birthdate")),
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
                          final now = DateTime.now();
                          String nowFormat =
                              DateFormat('yy/MM/dd - HH:mm:ss').format(now);
                          if (formKey.currentState!.validate()) {
                            CustomerService().addNewCustomer(
                                _nameController.text,
                                _memoController.text,
                                _phoneController.text,
                                _birthdateController.text,
                                nowFormat);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                "customer created",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green.shade400,
                            ));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Create",
                          style: TextStyle(fontSize: 16),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

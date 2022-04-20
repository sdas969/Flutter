import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saralbuild_task/constants.dart';
import 'package:saralbuild_task/user_schema.dart';
import 'package:http/http.dart' as http;

class EditUser extends StatefulWidget {
  final User userData;
  const EditUser({Key? key, required this.userData}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

enum Gender { male, female }

enum Status { active, inactive }

class _EditUserState extends State<EditUser> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  Gender gender = Gender.male;
  Status status = Status.active;
  User user = User();
  bool _isUploading = false;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.userData.name);
    _emailController = TextEditingController(text: widget.userData.email);
    setState(() {
      gender = widget.userData.gender == 'male' ? Gender.male : Gender.female;
      status =
          widget.userData.status == 'active' ? Status.active : Status.inactive;
    });

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  postData({required User userDetails}) async {
    setState(() {
      _isUploading = true;
    });
    Map<String, dynamic> userJsonData = userDetails.toJson();
    userJsonData['id'] = userJsonData['id'].toString();
    final response = await http.patch(
      Uri.parse('https://gorest.co.in/public/v2/users/' + userJsonData['id']),
      headers: {'Authorization': 'Bearer ' + apiToken},
      body: userJsonData,
    );
    setState(() {
      _isUploading = false;
    });
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      final errorMessage = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          content: Text(
              errorMessage[0]['field'] + ' ' + errorMessage[0]['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(widget.userData.name!),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Name'),
                      TextField(
                        controller: _nameController,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Email ID'),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Gender'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              gender = Gender.male;
                            }),
                            child: Card(
                              color: gender == Gender.male
                                  ? Colors.blue.shade900.withOpacity(0.8)
                                  : Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.male,
                                      size: 80,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              gender = Gender.female;
                            }),
                            child: Card(
                              color: gender == Gender.female
                                  ? Colors.pink.withOpacity(0.8)
                                  : Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.female,
                                      size: 80,
                                      color: Colors.white,
                                    ),
                                    Text('Female',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Status'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              status = Status.active;
                            }),
                            child: Card(
                              color: status == Status.active
                                  ? Colors.greenAccent.withOpacity(0.8)
                                  : Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 20,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'ACTIVE',
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              status = Status.inactive;
                            }),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 20,
                              color: status == Status.inactive
                                  ? Colors.redAccent
                                  : Colors.blueGrey,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'INACTIVE',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.blue.shade900,
                textColor: Colors.white,
                padding: const EdgeInsets.all(16),
                minWidth: double.infinity,
                onPressed: () {
                  user.id = widget.userData.id!.toInt();
                  user.email = _emailController.text;
                  user.name = _nameController.text;
                  user.gender = gender == Gender.male ? 'male' : 'female';
                  user.status = status == Status.active ? 'active' : 'inactive';
                  postData(userDetails: user);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: _isUploading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Update User',
                        style: TextStyle(fontSize: 20),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:saralbuild_task/user_schema.dart';
import 'package:saralbuild_task/add_user.dart';
import 'package:saralbuild_task/constants.dart';
import 'package:saralbuild_task/edit_user.dart';
import 'package:saralbuild_task/view_user.dart';

class ReadUsers extends StatefulWidget {
  const ReadUsers({Key? key}) : super(key: key);

  @override
  State<ReadUsers> createState() => _ReadUsersState();
}

class _ReadUsersState extends State<ReadUsers> {
  late StreamController<List<User>> _usersController;

  Future fetchUsers() async {
    final response = await http.get(
        Uri.parse('https://gorest.co.in/public/v2/users'),
        headers: {'Authorization': 'Bearer ' + apiToken});
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      List<User> userData = [];
      for (int i = 0; i < data.length; i++) {
        userData.add(User.fromJson(data[i]));
      }
      return userData;
    } else {
      throw Exception('Failed to load users');
    }
  }

  loadUsers() async {
    fetchUsers().then((res) async {
      _usersController.add(res);
      return res;
    });
  }

  deleteUser({required int id}) async {
    await http.delete(
        Uri.parse('https://gorest.co.in/public/v2/users/' + id.toString()),
        headers: {'Authorization': 'Bearer ' + apiToken});
  }

  @override
  void initState() {
    _usersController = StreamController(sync: true);
    Timer.periodic(const Duration(seconds: 1), (_) => loadUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddUser())),
        label: const Text('Add User'),
        icon: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: StreamBuilder<List<User>>(
          stream: _usersController.stream,
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name!,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.email),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            child: Text(
                                                snapshot.data![index].email!)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.person),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            child: Text(snapshot
                                                .data![index].gender!
                                                .toUpperCase())),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Card(
                                      color: snapshot.data![index].status! ==
                                              'active'
                                          ? Colors.green
                                          : Colors.redAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(snapshot
                                            .data![index].status!
                                            .toUpperCase()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditUser(
                                                userData: User(
                                                    id: snapshot
                                                        .data![index].id,
                                                    name: snapshot
                                                        .data![index].name,
                                                    email: snapshot
                                                        .data![index].email,
                                                    gender: snapshot
                                                        .data![index].gender,
                                                    status: snapshot
                                                        .data![index]
                                                        .status)))),
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () => deleteUser(
                                        id: snapshot.data![index].id!),
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewUser(
                                                userData: User(
                                                    id: snapshot
                                                        .data![index].id,
                                                    name: snapshot
                                                        .data![index].name,
                                                    email: snapshot
                                                        .data![index].email,
                                                    gender: snapshot
                                                        .data![index].gender,
                                                    status: snapshot
                                                        .data![index]
                                                        .status)))),
                                    icon: const Icon(
                                      Icons.remove_red_eye,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

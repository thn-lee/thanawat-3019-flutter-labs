import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab12_p1/model/user.dart';
import '../model/user.dart';

Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch user');
  }
}

class ApiRetrieved extends StatefulWidget {
  const ApiRetrieved({Key? key}) : super(key: key);

  @override
  _ApiRetrievedState createState() => _ApiRetrievedState();
}

class _ApiRetrievedState extends State<ApiRetrieved> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercise 1 by Thanawat Leelawatcharamas 613040301-9',
        ),
      ),
      body: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                    '${snapshot.data?.name} works at ${snapshot.data?.company.name}'),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    '$snapshot.error',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}

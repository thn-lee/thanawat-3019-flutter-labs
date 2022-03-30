import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/album.dart';

class ApiRetrieved extends StatefulWidget {
  const ApiRetrieved({Key? key}) : super(key: key);

  @override
  _ApiRetrievedState createState() => _ApiRetrievedState();
}

class _ApiRetrievedState extends State<ApiRetrieved> {
  List<Album> _albumList = [];
  @override
  void fetchData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    http.Response response = await http.get(url);
    setState(() {
      _albumList = AlbumList.fromJson(jsonDecode(response.body)).album;
    });
  }

  void initState() {
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetch Data Example',
        ),
      ),
      body: ListView.builder(
        itemCount: _albumList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_albumList[index].id}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _albumList[index].title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

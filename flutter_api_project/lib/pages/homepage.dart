import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


import '../models/usermodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');

  print(fetchData()) {
    // TODO: implement print
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<User>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text('${snapshot.data![index].id}'),
                        title: Text(snapshot.data![index].name),
                      );
                    });
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }

  Future<List<User>> fetchData() async {
    final response = await http.get(uri);
    List jsonResponse = jsonDecode(response.body.toString());
    List<User> userList = createUserList(jsonResponse);
    return userList;
  }

  List<User> createUserList(List jsonResponse) {
    List<User> list = [];
    for (int i = 0; i < jsonResponse.length; i++) {
      User user =
          User(name: jsonResponse[i]['name'], id: jsonResponse[i]['id']);
      list.add(user);
    }
    return list;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {

  late List users;
  bool loading = false;

  Future<String> getUsers() async {
    setState(() => this.loading = true);
    var response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    setState(() => users = json.decode(response.body.toString()));

    setState(() => this.loading = false);
    return 'success';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this.getUsers();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('REST API'),
      ),
      body: new Column(
        children: <Widget>[
          this.loading
              ? new Center(
            child: new CircularProgressIndicator(),
            heightFactor: 12.0,
          )
              : new Expanded(
            child: new ListView.builder(
                itemCount: users == null ? 0 : users.length,
                itemBuilder: (BuildContext context, int index) {
                  var name = users[index]['name'];
                  var email = users[index]['email'];

                  return new Column(
                    children: <Widget>[
                      new ListTile(
                        leading: CircleAvatar(
                          child: new Icon(Icons.account_box),
                        ),
                        title: Text(name),
                        subtitle: Text(email),
                      ),
                      new Divider(),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

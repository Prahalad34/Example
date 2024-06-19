// import 'package:example/user.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   List<user> users = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title:  Center(child: Text('Api Call')),
//         ),
//       body: ListView.builder(
//         itemCount: users.length,
//           itemBuilder: (context, index) {
//           final user = users[index];
//           final email = user.email;
//             return ListTile(
//               title: Text(email),
//             );
//           },),
//       floatingActionButton: FloatingActionButton(
//         onPressed: fetchUsers,
//       ),
//     );
//   }
//   void fetchUsers() async {
//     print('FetchUsers called');
//     const url = 'https://randomuser.me/api/?results=50';
//     final uri = Uri.parse(url);
//     final response =  await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['results'] as List<dynamic>;
//     final transformed = results.map((e)  {
//       return user(
//           // email: e['email'],
//           // gender: e['gender'],
//           // phone: e['phone'],
//           // cell: e['cell'],
//           // nat:e['nat']);
//     }).toList();
//     setState(  (){
//       users = transformed ;
//     }
//
//     );
//     print('fetchusers complted');
//   }
// }

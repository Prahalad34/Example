// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class post extends StatefulWidget {
//   const post({Key? key}) : super(key: key);
//
//   @override
//   State<post> createState() => _postState();
// }
//
// class _postState extends State<post> {
//
//   final apiUrl = "https://jsonplaceholder.typicode.com/posts";
//   TextEditingController titleController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();
//
//   Future<void> sendPostRequest() async {
//     var response = await http.post(apiUrl as Uri,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "title": titleController.text,
//           "body": bodyController.text,
//           "userId": 1,
//         }));
//
//     if (response.statusCode == 200) {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text("Post created successfully!"),
//       ));
//     } else {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text("Failed to create post!"),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter POST Request Example'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(hintText: "Title"),
//             ),
//             TextField(
//               controller: bodyController,
//               decoration: InputDecoration(hintText: "Body"),
//             ),
//             TextButton(
//               onPressed: sendPostRequest,
//               child: Text("Create Post"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

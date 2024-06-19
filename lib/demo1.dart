import 'dart:convert';

import 'package:example/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class demo1 extends StatefulWidget {
  const demo1({Key? key}) : super(key: key);

  @override
  State<demo1> createState() => _demo1State();
}

class _demo1State extends State<demo1> {

 // final apiUrl = "https://jsonplaceholder.typicode.com/posts";
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future<void> sendPostRequest() async {
    var response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "title": titleController.text,
          "body": bodyController.text,
          "userId": 2,
          "id" : 1,
        }));

    if (response.statusCode == 201) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Post created successfully!"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to create post!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter POST Request Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  )
                ),
                contentPadding: EdgeInsets.all(7),
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(hintText: "Body",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  ),
                  borderRadius: BorderRadius.circular(7)
                ),
                  contentPadding: EdgeInsets.all(7),
                filled: true,
                fillColor: Colors.grey
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.orange
              ),
              child: TextButton(
                onPressed: sendPostRequest,
                child: Center(child: Text("Create Post")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

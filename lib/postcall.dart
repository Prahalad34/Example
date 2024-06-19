import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class postcall extends StatefulWidget {
  const postcall({Key? key}) : super(key: key);

  @override
  State<postcall> createState() => _postcallState();
}

class _postcallState extends State<postcall> {

  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String result = ''; // To store the result from the API call

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _postData() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': nameController.text,
          'email': emailController.text,
          // Add any other data you want to send in the body
        }),
      );

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        Map<String, dynamic> responseJson = json.decode(response.body);
        final responseData = jsonDecode(response.body);
        print(responseJson["name"].toString());
        print(response.body);
        print(response.statusCode.toString());
        setState(() {
          result = 'ID: ${responseData['id']}\nName: ${responseData['name']}\nEmail: ${responseData['email']}';
        });
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api Call'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 6,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  )
                ),
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.all(7),
                  hintText: 'Name'),
            ),
            SizedBox(height: 15,),
            Text("Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 6,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  )
                ),
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.all(7),
                  hintText: 'Email'),
            ),
            SizedBox(height: 25,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.yellow
              ),
              child: TextButton(
                onPressed: _postData,
                child: Center(child: Text('Submit',style: TextStyle(color: Colors.white),)),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              result,
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

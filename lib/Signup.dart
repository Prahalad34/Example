import 'dart:convert';

import 'package:example/Snake.dart';
import 'package:example/setting.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
              controller: email,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none
                    )
                  ),
                  hintText: "Enter Email Id",
                filled: true,
                fillColor: Colors.grey
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none
                    )
                  ),
                  hintText: "Enter password ",
                filled: true,
                fillColor: Colors.grey
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
               onTap: (){
                 login();
               },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange
                ),
                child: Center(child: Text("SignUp",style: TextStyle(color: Colors.white),),),
              ),
            )
          ],
        ),
      ),
    ));
  }
  Future<void> login() async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Please fill the blank")));

    //var url = BaseUrl.login;
      var response = await http.post(Uri.parse('https://reqres.in/api/register'),
          body: ({
            'email': email.text,
            'password': password.text
          }));
      if (response.statusCode == 200) {
        //Map<String, dynamic> responseJson = json.decode(response.body);
        var Data = jsonDecode(response.body.toString());
        print("Account Created Successfully");
        print(response.body);
        print(response.statusCode.toString());
        print(Data['token'].toString());

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Snake()),
        );
      }
      else {
        print("Failed");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));

      }
    }
  }


  // void login(String email , password) async {
  //
  //   try{
  //      Response response = await post(Uri.parse('https://reqres.in/api/register'),
  //        body: {
  //          'email' : email,
  //          'password' : password
  //        }
  //      );
  //      if(response.statusCode == 200){
  //       var Data = jsonDecode(response.body.toString());
  //       print(Data);
  //        print('account created successfull');
  //      }else{
  //        print('Failed');
  //      }
  //
  //   }catch (e){
  //     print(e.toString());
  //   }
  //
  // }




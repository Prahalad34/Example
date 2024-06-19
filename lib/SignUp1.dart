import 'package:example/Login1.dart';
import 'package:example/demo1.dart';
import 'package:example/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {

  final firebase_auth_service _auth = firebase_auth_service();

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  void dispose() {
   _username.dispose();
   _email.dispose();
   _password.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _username,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none
                      )
                  ),
                  hintText: "User Name",
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _email,
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
              obscureText: _obscureText,
              controller: _password,
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
                  fillColor: Colors.grey,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                _SignUp();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange
                ),
                child: Center(child: Text("SignUp",style: TextStyle(color: Colors.white),),),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account"),
                SizedBox(width: 3,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login1(),));
                  },
                    child: Text("Login",style: TextStyle(color: Colors.blue),))
              ],
            )
          ],
        ),
      ),
    ));
  }

    void _SignUp() async {

      String username = _username.text;
      String email = _email.text;
      String password = _password.text;

      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if(user!= null) {
        print("successsfully create");
        Navigator.push(context, MaterialPageRoute(builder: (context) => demo1(),));

      }else {
        print("Somethig error");

      }
  }
}

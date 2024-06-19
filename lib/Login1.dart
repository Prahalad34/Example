import 'package:example/SignUp1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'demo1.dart';
import 'firebase_auth_service.dart';
class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {

  final firebase_auth_service _auth = firebase_auth_service();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  void dispose() {
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

  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }




  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In a real app, you'd often call
      // a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: "Enter Email Id",
                  filled: true,
                  fillColor: Colors.grey,
                ),
                validator: _validateEmail,
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _obscureText,
                controller: _password,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: "Enter password",
                  filled: true,
                  fillColor: Colors.grey,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                validator: _validatePassword,
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  _SignIn();
                  _submitForm();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange
                  ),
                  child: Center(child: Text("Login",style: TextStyle(color: Colors.white),),),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("create an account"),
                  SizedBox(width: 3,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp1(),));
                    },
                      child: Text("SignUp",style: TextStyle(color: Colors.blue),))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void _SignIn() async {

    String email = _email.text;
    String password = _password.text;

    User? user = await _auth.signIpWithEmailAndPassword(email, password);

    if(user!= null) {
      print("successsfully Login");
      Navigator.push(context, MaterialPageRoute(builder: (context) => demo1(),));

    }else {
      print("Somethig error");
    }
  }


}

import 'dart:developer';

import 'package:example/Login1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  String verificationid;

  Otp({super.key, required this.verificationid});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController _otpauth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Auth"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _otpauth,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  hintText: "Enter a Otp",
                  contentPadding: EdgeInsets.all(7),
                  suffixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.grey),
              keyboardType: TextInputType.phone,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: _otpauth.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login1(),));
                    });
                  } catch (ex) {
                    
                    log(ex.toString());
                  }
                },
                child: Center(
                    child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )))
          ],
        ),
      ),
    );
  }
}

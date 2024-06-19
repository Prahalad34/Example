import 'package:example/Otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phoneauth extends StatefulWidget {
  const Phoneauth({Key? key}) : super(key: key);

  @override
  State<Phoneauth> createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  TextEditingController _phoneauth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Number Auth"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneauth,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  hintText: "Enter a number",
                  contentPadding: EdgeInsets.all(7),
                  suffixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.grey),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationid, int? resendtoken) {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Otp(verificationid: verificationid,),));

                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: _phoneauth.text.toString());
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

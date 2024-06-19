import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneNumber = '';
  String smsCode = '';
  String verificationId = '';

  void _verifyPhone() async {
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential credential) {
      _auth.signInWithCredential(credential).then((UserCredential userCredential) {
        // Handle successful sign-in
      }).catchError((error) {
        // Handle sign-in error
        print('Sign-in error: $error');
      });
    };

    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
      // Handle verification failure
      print('Verification failed: ${authException.message}');
    };

    final PhoneCodeSent codeSent = (String verificationId, int? resendToken) {
      // Save verification ID to use later
      setState(() {
        this.verificationId = verificationId;
      });
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
      // Auto-retrieval timeout
      setState(() {
        this.verificationId = verificationId;
      });
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void _signInWithSmsCode() async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    _auth.signInWithCredential(credential).then((UserCredential userCredential) {
      // Handle successful sign-in
    }).catchError((error) {
      // Handle sign-in error
      print('Sign-in error: $error');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Phone Number',
            ),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                smsCode = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'SMS Code',
            ),
          ),
          ElevatedButton(
            onPressed: _verifyPhone,
            child: Text('Verify Phone Number'),
          ),
          ElevatedButton(
            onPressed: _signInWithSmsCode,
            child: Text('Sign In with SMS Code'),
          ),
        ],
      ),
    );
  }
}





import 'package:firebase_auth/firebase_auth.dart';

class firebase_auth_service {

    FirebaseAuth _auth = FirebaseAuth.instance;

    Future<User?> signUpWithEmailAndPassword(String email , String password) async {

      try{

        UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        return credential.user;

      } catch (e){
        print("Some Error");
      }
      return null;

    }

    Future<User?> signIpWithEmailAndPassword(String email , String password) async {

      try{

        UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        return credential.user;

      } catch (e){
        print("Some Error");
      }
      return null;

    }


   }
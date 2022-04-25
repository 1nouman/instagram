

 import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthController{

  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;



  Future <String> signUpUser({
    required  String name,
    required  String email,
    required  String password,
    required  String bio,
    required  Uint8List userImage,

 }) async{

    String res='creating users';
     try{
       if ( name.isNotEmpty || password.isNotEmpty|| email.isNotEmpty|| bio.isNotEmpty|| userImage!=null){

         // create the user
     UserCredential creds=   await  _auth.createUserWithEmailAndPassword(email: email, password: password);
     print(creds.user!.uid);
       //  with set () method
     _firestore.collection('Users').doc(creds.user!.uid).set({
       'name':name,
       'email':email,
       'password':password,
       'bio':bio,
       'image':userImage,
       'followers':[],
       'following':[]
     });
     // with add () method
     // _firestore.collection('Users').add({
     //   'name':name,
     //   'email':email,
     //   'password':password,
     //   'bio':bio,
     //   'image':userImage,
     //   'followers':[],
     //   'following':[]
     // });




       }
     }catch (e){

     }

    return res;

  }


 }
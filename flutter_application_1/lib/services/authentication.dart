import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/path/api_path.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;
  Future<bool> signup({required String email, required String password}) async {
    bool response = false;
    if (email.isNotEmpty || password.isNotEmpty) {
      UserCredential cerd = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // {"email": email, "password": password, "id": cerd.user?.uid}

      //  final user=myUser(userId: cerd.user?.uid , account: account, name: name, location: location)
      _database
          .collection(ApiPath.Users())
          .doc(cerd.user?.uid)
          .set({"email": email, "password": password, "id": cerd.user?.uid});
      response = true;
    } else {
      response = false;
    }
    return response;
  }

  Future<bool> Login({required String email, required String password}) async {
    bool response = false;
    if (email.isNotEmpty || password.isNotEmpty) {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      response = true;
    } else {
      response = false;
    }
    return response;
  }

  String getCurrentUserName() {
    return _auth.currentUser?.email as String;
  }
}

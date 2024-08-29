import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/path/api_path.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;
  Future<bool> Submit(
      {required bool Loggedin,
      required String email,
      required String password}) async {
    bool response = false;
    if (email.isNotEmpty || password.isNotEmpty) {
      if (Loggedin) {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        response = true;
        print("LOG IN METHOD IS SUCCESS :  ${user.user?.displayName}");
      } else {
        UserCredential cerd = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        _database.collection(ApiPath.Users()).doc(cerd.user?.uid).set({
          "email": email,
          "password": password,
          "id": cerd.user?.uid,
        });
        response = true;
      }
    } else {
      response = false;
    }

    return response;
  }

  Future<bool?> LoginWithGoogle() async {
    bool response = false;
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      final UserCredential userCred = await _auth.signInWithCredential(cred);
      if (userCred.user != null) {
        // print("SIGH IN METHOD IS SUCCESS :  ${userCred.user?.displayName}");

        _database.collection(ApiPath.Users()).doc(userCred.user?.uid).set({
          "email": userCred.user?.email,
          "name": userCred.user?.displayName,
          "id": userCred.user?.uid,
          "location": "",
        });
        response = true;
      } else {
        // print("SIGN IN METHOD ID FAILD : NO USER INFORAMEİON AVALİABLE ");
        response = false;
      }
    } catch (e) {
      print(e.toString());
      response = false;
    }
    return response;
  }

  Future getCurrentUserInfo() async {
    return await _database
        .collection(ApiPath.Users())
        .doc(_auth.currentUser?.uid)
        .get();
  }

  String getCurrentUserEmail() {
    return _auth.currentUser?.email as String;
  }

  String getCurrentUserID() {
    return _auth.currentUser?.uid as String;
  }

  String getCurrentUserName() {
    return _database.collection(ApiPath.Users()).doc(getCurrentUserID()).get()
        as String;
  }

  void Logout() async {
    return await _auth.signOut();
  }

  Future EditUser({required name, required location}) async {
    return await _database
        .collection(ApiPath.Users())
        .doc(getCurrentUserID())
        .update({
      "name": name,
      "location": location,
    });
  }
}

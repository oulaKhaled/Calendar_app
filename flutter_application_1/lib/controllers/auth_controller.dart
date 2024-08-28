import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/path/api_path.dart';
import 'package:flutter_application_1/services/authentication.dart';

class AuthController {}
//   final _database = FirebaseFirestore.instance;

//   Future<bool> signup(
//       {required String email,
//       required String password,
//       required String name,
//       required String location}) async {
//     bool response = false;
//     if (email.isNotEmpty || password.isNotEmpty) {
//       UserCredential cerd =
//           await Auth().signup(email: email, password: password);
//       if (cerd != null) {
//         response = true;
//       } else {
//         response = false;
//       }
//     } else {
//       response = false;
//     }
//     return response;
//   }
// }

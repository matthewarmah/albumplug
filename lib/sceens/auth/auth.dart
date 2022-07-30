import 'package:albumplug3/models/my_app_user.dart';
import 'package:albumplug3/sceens/pages/login_page.dart';
import 'package:albumplug3/sceens/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authentication {
  FirebaseAuth connection = FirebaseAuth.instance;
  User? get currentuser => connection.currentUser;
  Stream<User?> get authStateChanges => connection.authStateChanges();
  //create MyAppUser from a Firebase User
  // ignore: missing_return
  MyAppUser? _userFromFirebaseUser(User? user) {
    return user != null
        ? MyAppUser(uid: user.uid, email: user.email, name: user.displayName)
        : null;
  }
// Stream<User?> get onAuthStateChanges() => connection.onAuthStateChanges();

  Future<String?> createUser(String name, String email, String password) async {
    try {
      final UserCredential credential = await connection
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (error) {
      return error.message;
    }
  }

  Future<String?> loginUser(String email, String password) async {
    try {
      final UserCredential credential = await connection
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (error) {
      return error.message;
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> currentUser() async {
    final User? user = await FirebaseAuth.instance.currentUser;
    return user!.uid.toString();
  }

  Stream<MyAppUser?> get user =>
      connection.authStateChanges().map(_userFromFirebaseUser);
}
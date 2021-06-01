import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:agriot/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';

// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  // String _API_KEY = "AIzaSyBfiEHXLmB09SfbbxEVGpFdeaocO1Icr0Q";

  final _auth = FirebaseAuth.instance;

  final _db = FirebaseFirestore.instance.collection("users");

  bool _isLoggedIn = false;

  bool supportsAppleSignIn = false;

  AuthProvider() {
    _auth.authStateChanges().listen(
      (fireUser) {
        if (fireUser == null) {
          print("(LISTENER) User Logged Out");
          _isLoggedIn = false;
          // _myData = null;
          notifyListeners();
          return;
        }
        print("(LISTENER) USER LOGGED IN = " + fireUser.email);
        _isLoggedIn = true;
        // fetchMyData(fireUser);
        notifyListeners();
      },
    );
  }

  Future initialize() async {
    return await Firebase.initializeApp();
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  Future<bool> signUpWithEmail(
    // BuildContext context,
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) {
        print("SIGN UP FAILED");
        return false;
      }
      print("SIGNED UP USER = " + result.user.email);
      await FirebaseFirestore.instance.collection("users").doc(email).set({
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      });
      Fluttertoast.showToast(msg: firstName + " Registered Successfully!");
      return true;
    } catch (error) {
      print("Got Error while signing UP. error = " + error.toString());
      // Toast.show(
      //   error.message,
      //   context,
      //   duration: 3,
      // );
      Fluttertoast.showToast(msg: error.message);

      return false;
    }
  }

  Future<bool> signInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) {
        print("SIGN IN FAILED");
        return false;
      }
      print("SIGNED IN USER = " + result.user.email);
      Fluttertoast.showToast(
        msg: email + " Successfully Logged In !",
      );
      return true;
    } catch (error) {
      print("Got Error while signing in. error = " + error.toString());
      // Toast.show(
      //   error.message,
      //   context,
      //   duration: 3,
      // );
      Fluttertoast.showToast(
        msg: error.message,
      );

      return false;
    }
  }

  Future<bool> signOut(
    BuildContext context,
  ) async {
    try {
      await _auth.signOut();

      notifyListeners();
      return true;
    } catch (error) {
      print(
        "Caught error in SIGNOUT(). error = " + error.toString(),
      );
      // Toast.show(
      //   error.message,
      //   context,
      //   duration: 3,
      // );
      return false;
    }
  }
}

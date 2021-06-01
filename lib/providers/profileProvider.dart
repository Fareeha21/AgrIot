import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String profileUrl;

  File _profileImage;

  void setProfileImage(
    File image,
  ) {
    this._profileImage = image;
    notifyListeners();
  }

  File get profileImage {
    return _profileImage;
  }

  Future<bool> saveDataToFirestore({
    @required String first_name,
    @required String last_name,
    @required String job,
    @required String address,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser.email)
          .update({
        "first_name": first_name,
        "last_name": last_name,
        "job": job,
        "address": address,
      });
      print("USER DATA of $first_name UPDATED IN FIREBASE");
      return true;
    } catch (error) {
      print("ERROR IN SAVE SATA TO FIRESTORE IN PROFILE PROVIDER. ERROR = " +
          error.toString());
      return false;
    }
  }
}

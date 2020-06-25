//database class

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userData = Firestore.instance.collection("users");

  // uploadUserInfo(userMapInfo) {
  //   Firestore.instance.collection("users").add(userMapInfo);
  // }

  Future updateUserData(String name, String email) async {
    return await userData.document(uid).setData({
      'name': name,
      'email': email,
    });
  }
}

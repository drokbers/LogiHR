import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Constants/Constants.dart';
import '../Services/auth_service.dart';
import '../Models/UserModel.dart';

class DatabaseServices {

  final CollectionReference profileList = FirebaseFirestore.instance.collection('users');
  
  

  static uploadProfilPhoto(File photo, String id) async {
    final _fireStore = FirebaseFirestore.instance;
    log(id);
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('photos')
        .child(id)
        .child('profilephoto');

    UploadTask task = reference.putFile(photo);
    String url = await (await task).ref.getDownloadURL();
    log(url);
    _fireStore.collection('users').doc(id).update({
      'profileImage': url,
    });
  }

  static uploadCoverPhoto(File photo, String id) async {
    final _fireStore = FirebaseFirestore.instance;
    log(id);
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('photos')
        .child(id)
        .child('coverphoto');

    UploadTask task = reference.putFile(photo);
    String url = await (await task).ref.getDownloadURL();
    log(url);
    _fireStore.collection('users').doc(id).update({
      'coverImage': url,
    });
  }



  static Future<QuerySnapshot> searchUsers(String name) async {
    Future<QuerySnapshot> users = usersRef
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: name + 'z')
        .get();

    return users;
    
  }

  //  static Future<String> interests(String id) async {
  //   final snapshot = await _fireStore
  //       .collection('users')
  //       .doc(id)
  //       .get(); //get the data
  //   return snapshot.data()['interests'].toString();
  // }
  
  
}

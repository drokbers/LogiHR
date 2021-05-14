import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const Color LogiColor = Color(0xFF1514EF); //android icin hex

final _fireStore = FirebaseFirestore.instance;

final usersRef = _fireStore.collection('users');

final storageRef = FirebaseStorage.instance.ref();


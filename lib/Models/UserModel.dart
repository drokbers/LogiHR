import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String id;
  final String name;
  final String profilePicture;
  final String email;
  final List interests;
  final String reportsTo;
  final String badges;
  final String attendeEvents;
  final String city;
  final String phoneNumber;
  final String position;
  final String department;
  final String coverImage;

  UserModel(
      {this.id,
      this.name,
      this.profilePicture,
      this.email,
      this.interests,
      this.reportsTo,
      this.badges,
      this.attendeEvents,
      this.city,
      this.phoneNumber,
      this.position,
      this.department,
      this.coverImage});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      name: doc['name'],
      profilePicture: doc['profilePicture'],
      email: doc['email'],
      interests: doc['interests'],
      reportsTo: doc['repdoc.data()ortsTo'],
      badges: doc['badges'],
      attendeEvents: doc['attendeEvents'],
      city: doc['city'],
      phoneNumber: doc['phoneNumber'],
      position: doc['position'],
      department: doc['department'],
      coverImage: doc['coverImage'],
    );
  }
}

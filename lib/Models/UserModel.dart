import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String profilePicture;
  String email;
  List interests;
  String reportsTo;
  String badges;
  String attendeEvents;
  String city;
  String phoneNumber;
  String position;
  String department;
  String coverImage;

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

  factory UserModel.fromDoc(DocumentSnapshot doc) {
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

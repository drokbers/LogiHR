import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// hatali sayfa

class NotificationsScreen extends StatelessWidget {
  final String documentId;

  NotificationsScreen(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        
        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['name']}");
        }

        return Text("loading");
      },
    );
  }
}
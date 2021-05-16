// hatali sayfa




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance.collection('users')
                .where("searchKeywords", arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.docs[index];
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            data['profilePicture'],
                            width: 150,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }

}
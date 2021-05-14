import 'package:flutter/material.dart';

import '../Models/UserModel.dart';
import './HomeScreen.dart';
import './NotificationsScreen.dart';
import './SearchScreen.dart';
import './ProfilScreen.dart';

class FeedScreen extends StatefulWidget {
  final String currentUserId;
  const FeedScreen({Key key, this.currentUserId}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(),
        SearchScreen(),
        NotificationsScreen(),
        ProfilScreen(
          currentUserId: widget.currentUserId,
          visitedUserId: widget.currentUserId,
        ),
      ].elementAt(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        selectedItemColor: Color(0xFF1514EF),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          //BottomNavigationBarItem(icon: Icon(Icons.home),label:'home'),
        ],
      ),
    
    );
    
  }
}

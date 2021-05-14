import 'package:flutter/material.dart';
import '../Constants/Constants.dart';
import './EditProfilImage.dart';

class ProfilScreen extends StatefulWidget {
  final String currentUserId;
  final String visitedUserId;

  const ProfilScreen({Key key, this.currentUserId, this.visitedUserId})
      : super(key: key);
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder(
      future: usersRef.doc(widget.visitedUserId).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(LogiColor),
                ),
              );
            }

        return ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Stack(
              children: [
                Container(
                    height: screenHeight,
                    width: screenWidth,
                    color: Colors.transparent),
                //en arka beyaz
                Container(
                    height: screenHeight,
                    width: screenWidth,
                    color: Colors.white),
                //kapak
                Container(
                    height: screenHeight * 0.25,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: (snapshot.data['coverImage']).isEmpty
                            ? AssetImage('assets/background.png')
                            : NetworkImage(snapshot.data['coverImage']),
                      ),
                    )),

                //sag ust ayarlar butonu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox.shrink(),
                    PopupMenuButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 30,
                      ),
                      itemBuilder: (_) {
                        return <PopupMenuItem<String>>[
                          new PopupMenuItem(
                            child: Text('Logout'),
                            value: 'logout',
                          ),
                          new PopupMenuItem(
                            child: Text('Settings'),
                            value: 'settings',
                          ),
                          new PopupMenuItem(
                            child: Icon(Icons.edit),
                            value: 'editcover',
                          )
                        ];
                      },
                      onSelected: (selectedItem) {},
                    )
                  ],
                ),

                //isim
                Positioned(
                  top: (screenHeight * 0.18),
                  right: (screenWidth * 0.1),
                  left: (screenWidth * 0.1),
                  child: Container(
                    height: (screenHeight * 0.25),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.grey[200]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            snapshot.data['name'],
                            style: TextStyle(
                                color: Color(0xFF23163D),
                                fontSize: 20.0,
                                fontFamily: 'Quicksand-bold',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            snapshot.data['position'],
                            style: TextStyle(
                                color: Color(0xFF23163D),
                                fontSize: 17.0,
                                fontFamily: 'Quicksand-regular'),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            snapshot.data['city'],
                            style: TextStyle(
                                color: Color(0xFF23163D),
                                fontSize: 15.0,
                                fontFamily: 'Quicksand-regular'),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.ac_unit),

                                SizedBox(width: screenWidth * 0.03),
                                // Container(width: 1.0, height: 20.0, color: Colors.grey),
                                SizedBox(width: screenWidth * 0.03),

                                Icon(Icons.ac_unit),
                                SizedBox(width: screenWidth * 0.03),

                                SizedBox(width: screenWidth * 0.03),

                                SizedBox(width: screenWidth * 0.03),
                                Icon(Icons.ac_unit),
                                SizedBox(width: screenWidth * 0.03),

                                SizedBox(width: screenWidth * 0.03),
                                Icon(
                                  Icons.ac_unit,
                                ),
                              ])
                        ]),
                  ),
                ),

                //profil foto
                Positioned(
                  top: (screenHeight * 0.065),
                  left: (screenHeight * 0.048),
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilImage()));
                      setState(() {});
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: screenHeight * 0.085,
                            backgroundImage: (snapshot.data['profileImage'])
                                    .isEmpty
                                ? AssetImage('assets/placeholder.png')
                                : NetworkImage(snapshot.data['profileImage']),
                          ),
                        ]),
                  ),
                ),
                Positioned(
                    top: (screenHeight * 0.19),
                    right: (screenWidth * 0.12),
                    child: Container(
                      child: Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: screenWidth * 0.1,
                      ),
                    )),
                // iletisim
                Positioned(
                  top: (screenHeight * 0.44),
                  right: (screenWidth * 0.2),
                  left: (screenWidth * 0.2),
                  child: Container(
                    height: (screenHeight * 0.05),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          size: (screenHeight * 0.048),
                        ),
                        SizedBox(width: screenWidth * 0.12),
                        Icon(
                          Icons.mail,
                          size: (screenHeight * 0.048),
                        ),
                        SizedBox(width: screenWidth * 0.12),
                        Icon(
                          Icons.message,
                          size: (screenHeight * 0.048),
                        ),
                      ],
                    ),
                  ),
                ),
                //interest
                Positioned(
                  top: (screenHeight * 0.5),
                  right: (screenWidth * 0.1),
                  left: (screenWidth * 0.1),
                  child: Container(
                    height: (screenHeight * 0.12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Interests',
                            style: TextStyle(
                                color: Color(0xFF23163D),
                                fontSize: 20.0,
                                fontFamily: 'Quicksand-bold',
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: screenWidth * 0.05),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: screenHeight * 0.04,
                              backgroundImage: NetworkImage(
                                  'https://i.imgur.com/yzeof3N.jpeg'),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('userModel.reportsTo',
                                    style: TextStyle(
                                        color: Color(0xFF23163D),
                                        fontSize: 17.0,
                                        fontFamily: 'Quicksand-bold',
                                        fontWeight: FontWeight.bold)),
                                Text('departman',
                                    style: TextStyle(
                                      color: Color(0xFF23163D),
                                      fontSize: 15.5,
                                      fontFamily: 'Quicksand-bold',
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                //reportsto
                Positioned(
                  top: (screenHeight * 0.65),
                  right: (screenWidth * 0.1),
                  left: (screenWidth * 0.1),
                  child: Container(
                    height: (screenHeight * 0.12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reports to',
                            style: TextStyle(
                                color: Color(0xFF23163D),
                                fontSize: 20.0,
                                fontFamily: 'Quicksand-bold',
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: screenWidth * 0.05),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: screenHeight * 0.038,
                              backgroundImage: (snapshot.data['profileImage'])
                                      .isEmpty
                                  ? AssetImage('assets/placeholder.png')
                                  : NetworkImage(snapshot.data['profileImage']),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data['reportsTo'],
                                    style: TextStyle(
                                        color: Color(0xFF23163D),
                                        fontSize: 17.0,
                                        fontFamily: 'Quicksand-bold',
                                        fontWeight: FontWeight.bold)),
                                Text('Chief Technology Officer, New York',
                                    style: TextStyle(
                                      color: Color(0xFF23163D),
                                      fontSize: 15.5,
                                      fontFamily: 'Quicksand-bold',
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    ));
  }
}

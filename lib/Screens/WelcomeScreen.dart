import 'package:flutter/material.dart';
import '../Widgets/RoundedButton.dart';
import '../screens/LoginScreen.dart';
import '../screens/RegistrationScreen.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Image.asset(
                'assets/logo.png',
                height: 200,
                width: 200,
              ),
              Text(
                'Welcome to LogiHR',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(children: [
            RoundedButton(
                btnText: 'LOG IN',
                onBtnPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                }),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
                btnText: 'SIGNUP',
                onBtnPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ));
                })
          ])
        ],
      ),
    )));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rp_project/Screens/Main_Page.dart';
import 'package:rp_project/main.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  bool isLoading = false;

  @override
  void initState() {
    ifAlreadyLoggedIn();
    super.initState();
  }

  void ifAlreadyLoggedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        setState(() {
          isAuth = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth == true) {
      child = MainPage();
    } else {
      child = MyHomePage(title: '',);
    }

    return Scaffold(
      body: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rp_project/Authentication/Login_Screen.dart';
import 'package:rp_project/Buttons/Landing_Page_Button_1.dart';
import 'package:rp_project/Buttons/Landing_Page_Button_2.dart';
import 'package:rp_project/Constants/Colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * (1 / 20)),
                SizedBox(height: screenHeight * (1 / 20)),
                LandingPageButton_1(
                  text: "Get Started",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: screenHeight * (0.5 / 20)),
                LandingPageButton_2(
                  text: "Login",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: screenHeight * (0.5 / 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

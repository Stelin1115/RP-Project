import 'package:flutter/material.dart';
import 'package:rp_project/Buttons/Main_Page_Button.dart';
import 'package:rp_project/Constants/Colors.dart';
import 'package:rp_project/Screens/Landing_Screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: TextStyle(color: kPrimaryWhiteColor),
        ),
        backgroundColor: kPrimaryGreenColor,
        //elevation: 0.5,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout_outlined,
              color: kPrimaryWhiteColor,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => LandingScreen()));
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MainPageButton(
                text: "Coconut meat freshness",
              ),
              MainPageButton(
                text: "Coconut variants",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MainPageButton(
                text: "Coconut growths",
              ),
              MainPageButton(
                text: "Quantity of Coconut milk and oil",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MainPageButton(
                text:
                    "Coir plants nutrient deficiency & solution recomendation",
              ),
              MainPageButton(
                text: "Disease of coir plants",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MainPageButton(
                text: "Coconut leaf disease",
              ),
              MainPageButton(
                text: "Blooming stem stage",
              ),
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

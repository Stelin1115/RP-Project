import 'package:flutter/material.dart';
import 'package:rp_project/Constants/Colors.dart';

class LandingPageButton_1 extends StatelessWidget {
  const LandingPageButton_1(
      {Key? key, required this.text, required this.function})
      : super(key: key);
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(0),
      height: 70.0,
      width: screenWidth * 0.90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          backgroundColor: kPrimaryGreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
            side: BorderSide(color: kPrimaryGreenColor),
          ),
        ),
        onPressed: function,
        child: Text(text, style: TextStyle(fontSize: 15, color: Colors.white)),
      ),
    );
  }
}

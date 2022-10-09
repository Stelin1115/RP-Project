import 'package:flutter/material.dart';
import 'package:rp_project/Constants/Colors.dart';

class LoginPageButton extends StatelessWidget {
  const LoginPageButton({Key? key, required this.child, required this.function})
      : super(key: key);
  final Widget child;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      height: 55.0,
      width: screenWidth * 0.90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryGreenColor,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
            side: BorderSide(color: kPrimaryGreenColor),
          ),
        ),
        onPressed: function,
        child: child,
      ),
    );
  }
}

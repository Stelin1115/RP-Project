import 'package:flutter/material.dart';
import 'package:rp_project/Constants/Colors.dart';
import 'package:rp_project/Screens/Image/Image_Select.dart';

class MainPageButton extends StatelessWidget {
  const MainPageButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: screenHeight * (1 / 5.5),
          width: screenWidth * (1 / 2.4),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ImageSelect(
                        title: text,
                      )));
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              elevation: MaterialStateProperty.all(3),
              backgroundColor: MaterialStateProperty.all(kPrimaryGreenColor),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kPrimaryWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

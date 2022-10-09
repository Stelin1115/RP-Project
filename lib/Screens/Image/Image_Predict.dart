import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rp_project/Constants/Colors.dart';

class ReviewPage extends StatefulWidget {
  final XFile image;
  final String title;
  const ReviewPage({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kPrimaryWhiteColor,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: kPrimaryWhiteColor),
          ),
          backgroundColor: kPrimaryGreenColor,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back)),
          ),
          //elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.file(File(widget.image.path)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryGreenColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99)),
                ),
                // disabledColor: Colors.red,
                // disabledTextColor: Colors.black,

                onPressed: () {},
                child: Text(
                  "Predict",
                  style: TextStyle(color: kPrimaryWhiteColor),
                ),
              ),
            ],
          ),
        ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rp_project/Constants/Colors.dart';
import 'package:rp_project/Screens/Image/Image_Predict.dart';
import 'package:rp_project/Screens/Main_Page.dart';

class ImageSelect extends StatefulWidget {
  final String title;
  const ImageSelect({Key? key, required this.title}) : super(key: key);

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  void _pickeImage() {
    showDialog<ImageSource>(
        context: context,
        builder: (context) =>
            AlertDialog(content: Text("Choose image source"), actions: [
              TextButton(
                child: Text("Camera"),
                onPressed: () {
                  _getFromcamera();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("Gallery"),
                onPressed: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
              ),
            ]));
  }

  File? _image;
  final _picker = ImagePicker();
  var pickedImagee;
  // Implementing the image picker

  Future<void> _getFromGallery() async {
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    pickedImagee = pickedImage;
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _getFromcamera() async {
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => MainPage()));
                },
                child: Icon(Icons.arrow_back)),
          ),
          //elevation: 0.5,
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(
          //       Icons.home_rounded,
          //       color: kPrimaryWhiteColor,
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(MaterialPageRoute(
          //           builder: (BuildContext context) => MainPage()));
          //     },
          //   )
          // ],
        ),
        body: RefreshIndicator(
          color: kPrimaryGreenColor,
          displacement: 50,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ImageSelect(title: widget.title)));
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     "Whats Up Bud?",
                  //     style: TextStyle(
                  //       color: primaryColor,
                  //       fontSize: 30,
                  //       // fontWeight: FontWeight.bold
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Capture / Upload your picture",
                      style: TextStyle(color: kPrimaryGreyColor, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 30),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: screenWidth * 0.75,
                    width: screenWidth * 0.75,
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover)
                        : SizedBox(
                            width: screenWidth * 0.75,
                            height: screenWidth * 0.75,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(30.0),
                                backgroundColor: kPrimaryWhiteColor,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 3, color: kPrimaryGreenColor),
                                    borderRadius: BorderRadius.circular(7.0)),
                              ),
                              child: Icon(Icons.camera_alt,
                                  size: 20, color: kPrimaryGreenColor),
                              onPressed: () {
                                _pickeImage();
                              },
                            ),
                          ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryGreenColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 90),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99)),
                    ),
                    // disabledColor: Colors.red,
                    // disabledTextColor: Colors.black,

                    onPressed: () {
                      if (pickedImagee != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Image_Predict(
                                  image: pickedImagee,
                                  title: widget.title,
                                )));
                      }
                    },
                    child: Text(
                      "Predict",
                      style: TextStyle(color: kPrimaryWhiteColor),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryGreenColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 90),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99)),
                    ),
                    // disabledColor: Colors.red,
                    // disabledTextColor: Colors.black,

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ImageSelect(title: widget.title)));
                    },
                    child: Text(
                      "Reload",
                      style: TextStyle(color: kPrimaryWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

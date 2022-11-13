import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rp_project/Constants/Colors.dart';
import 'package:tflite/tflite.dart';

class Image_Predict extends StatefulWidget {
  final XFile image;
  final String title;
  const Image_Predict({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  State<Image_Predict> createState() => _Image_PredictState();
}

class _Image_PredictState extends State<Image_Predict> {
  @override
  void initState() {
    super.initState();
  }

  void Find() async {
    String? res = await Tflite.loadModel(
        model: "assets/mobilenet_v1_1.0_224.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    print(res);
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Details about your picture",
                    style: TextStyle(color: kPrimaryGreyColor, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
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

                onPressed: () {
                  Find();
                },
                child: Text(
                  "Print",
                  style: TextStyle(color: kPrimaryWhiteColor),
                ),
              ),
            ],
          ),
        ));
  }
}

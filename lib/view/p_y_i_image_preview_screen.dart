import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/screen_size.dart';

class PYIImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  const PYIImagePreviewScreen({super.key, required this.imagePath});

  @override
  State<PYIImagePreviewScreen> createState() => _PYIImagePreviewScreenState();
}

class _PYIImagePreviewScreenState extends State<PYIImagePreviewScreen> {
  late File _imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageFile = File(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ScreenSize.screenHeight,
            width: ScreenSize.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Image.file(
                _imageFile,
                width: width,
                height: height / 1.2,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/retake (6).png",
                    width: width / 2.3,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/confirm (6).png",
                      width: width / 2.3,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

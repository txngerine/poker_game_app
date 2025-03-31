import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/terms_page.dart';

import '../constants/screen_size.dart';
import '../controller/signup_controller.dart';

class PYIImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  const PYIImagePreviewScreen({super.key, required this.imagePath});

  @override
  State<PYIImagePreviewScreen> createState() => _PYIImagePreviewScreenState();
}

class _PYIImagePreviewScreenState extends State<PYIImagePreviewScreen> {
  late File _imageFile;
  bool isUploading = false;
  String? _base64String;

  @override
  void initState() {
    super.initState();
    _imageFile = File(widget.imagePath);
  }

  Future<void> uploadImage() async {
    try {
      setState(() {
        isUploading = true;
      });
      //convert image to base64
      String base64String = base64Encode(_imageFile.readAsBytesSync());
      _base64String = base64String;
      log("Base64 String: $_base64String");
      //get userId
      String userId = SignupController.userId.toString();
      String apiUrl =
          "http://3.6.170.253:1080/server.php/api/v1/player/save-id/$userId?XDEBUG_SESSION_START=netbeans-xdebug";
      Map<String, dynamic> requestBody = {
        "photo": base64String,
        "id": userId,
        "deviceId": 1
      };
      print("00000");
      print(apiUrl);
      print(userId);
      print(requestBody["id"]);
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      // log("Response: ${response.body}");

      // Check response
      if (response.statusCode == 200) {
        log("Image uploaded successfully: ${response.body}");
        Navigator.push(
            context,
            PageTransition(
                child: const TermsPage(),
                type: PageTransitionType.rightToLeftWithFade));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: CupertinoColors.activeGreen,
            content: const Text(
              "Image uploaded successfully!",
              style: TextStyle(color: Colors.white),
            )));
      } else {
        log("Failed to upload image: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: CupertinoColors.destructiveRed,
            content: const Text(
              "ID not detected. Please ensure your ID is clearly visible.",
              style: TextStyle(color: Colors.white),
            )));
      }
    } catch (e) {
      log("Error uploading image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to upload image.")),
      );
    } finally {
      setState(() {
        isUploading = false;
      });
    }
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
                    onTap: () {
                      uploadImage();
                    },
                    child: isUploading
                        ? SizedBox(
                            width: width / 2.3,
                            child: Center(
                                child: const CircularProgressIndicator()))
                        : Image.asset(
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

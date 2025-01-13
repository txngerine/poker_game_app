import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/view/kyc_complete_page.dart';

import 'front_camera_page.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  const ImagePreviewScreen({super.key, required this.imagePath});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  late File _imageFile;
  bool _isUploading = false;
  String? _base64String;

  @override
  void initState() {
    super.initState();
    _imageFile = File(widget.imagePath);
  }

  Future<void> uploadImage() async {
    try {
      setState(() {
        _isUploading = true;
      });

      // Convert the image to Base64
      String base64String = base64Encode(_imageFile.readAsBytesSync());
      _base64String = base64String;
      log("Base64 String: $_base64String");

      // API URL
      const String apiUrl =
          "http://3.6.170.253:1080/server.php/api/v1/players/1?XDEBUG_SESSION_START=netbeans-xdebug";

      Map<String, dynamic> requestBody = {
        "photo": base64String,
        "id": SignupController.userId,
        "deviceId": 1
      };
      print("00000");
      print(requestBody["id"]);
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      log("Response: ${response.body}");

      // Check response
      if (response.statusCode == 200) {
        log("Image uploaded successfully: ${response.body}");
        Navigator.push(
            context,
            PageTransition(
                child: const KycCompletePage(),
                type: PageTransitionType.rightToLeftWithFade));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Image uploaded successfully!")),
        );
      } else {
        log("Failed to upload image: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  "Face not detected. Please ensure your face is clearly visible, well-lit, and positioned directly in front of the camera.")),
        );
      }
    } catch (e) {
      log("Error uploading image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to upload image.")),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: _imageFile.path.isNotEmpty
                  ? Column(
                      children: [
                        Image.file(
                          _imageFile,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.3,
                        ),
                        const SizedBox(height: 20),
                        _isUploading
                            ? const CircularProgressIndicator()
                            : GestureDetector(
                                onTap: () {
                                  uploadImage();
                                },
                                child: Image.asset(
                                  "assets/images/confirm.png",
                                  height: 57,
                                ),
                              ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FrontCameraPage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/images/retake.png",
                            height: 57,
                          ),
                        ),
                      ],
                    )
                  : const Text("No image captured."),
            ),
          ),
        ],
      ),
    );
  }
}

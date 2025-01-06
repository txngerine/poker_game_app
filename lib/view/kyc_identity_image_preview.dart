import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/kyc_identity_camera_page.dart';
import 'package:pokerpad/view/kyc_page.dart';

import '../constants/screen_size.dart';

class KycIdentityImagePreview extends StatefulWidget {
  final String imagePath;

  const KycIdentityImagePreview({super.key, required this.imagePath});

  @override
  State<KycIdentityImagePreview> createState() =>
      _KycIdentityImagePreviewState();
}

class _KycIdentityImagePreviewState extends State<KycIdentityImagePreview> {
  late File _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = File(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
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
          Center(
            child: _imageFile.path.isNotEmpty
                ? Column(
                    children: [
                      Image.file(
                        fit: BoxFit.cover,
                        _imageFile,
                        width: 700,
                        height: MediaQuery.of(context).size.height / 1.3,
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: KycPage(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                          },
                          child: Image.asset("assets/images/confirm.png")),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KycIdentityCameraPage()));
                          },
                          child: Image.asset("assets/images/retake.png")),
                    ],
                  )
                : const Text("No image captured."),
          ),
        ],
      ),
    );
  }
}

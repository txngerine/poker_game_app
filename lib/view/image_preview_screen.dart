import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/front_camera_page.dart';
import 'package:pokerpad/view/kyc_complete_page.dart';

import '../constants/screen_size.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  const ImagePreviewScreen({super.key, required this.imagePath});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  late File _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = File(widget.imagePath);
  }

  Future<void> _cropImage() async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: _imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _imageFile = File(croppedFile.path);
      });
    }
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
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.3,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const KycCompletePage(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                        child: Image.asset(
                          "assets/images/confirm.png",
                          height: 57,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FrontCameraPage(),
                              ));
                        },
                        child: Image.asset(
                          "assets/images/retake.png",
                          height: 57,
                        )),
                  ],
                )
              : const Text("No image captured."),
        ),
      ],
    ));
  }
}

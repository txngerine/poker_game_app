import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/p_y_i_image_preview_screen.dart';

import '../constants/screen_size.dart';

class PYICameraPage extends StatefulWidget {
  const PYICameraPage({super.key});

  @override
  State<PYICameraPage> createState() => _PYICameraPageState();
}

class _PYICameraPageState extends State<PYICameraPage> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  bool _isCameraInitialized = false;
  String? _imagePath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      CameraDescription frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );
      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _cameraController.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      debugPrint("Error initializing camera: $e");
    }
  }

  Future<void> captureImage() async {
    if (!_cameraController.value.isInitialized ||
        _cameraController.value.isTakingPicture) {
      debugPrint("Camera not ready or already capturing.");
      return;
    }

    try {
      final XFile file = await _cameraController.takePicture();

      if (file.path.isNotEmpty) {
        setState(() {
          _imagePath = file.path;
        });
        debugPrint("Image captured at path: ${file.path}");
        Navigator.push(
            context,
            PageTransition(
                // child: KycIdentityImagePreview(
                //   imagePath: file.path,
                // ),
                child: PYIImagePreviewScreen(imagePath: file.path),
                type: PageTransitionType.rightToLeftWithFade));
      }
    } catch (e) {
      debugPrint("Error capturing image: $e");
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 1.2,
                  width: width,
                  child: _isCameraInitialized
                      ? Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                  height: height / 1.2,
                                  width: width,
                                  child: CameraPreview(_cameraController)),
                            ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    captureImage();
                  },
                  child: Image.asset(
                      width: width / 6,
                      "assets/images/shutter_button_white.png"),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     if (_isCameraInitialized) {
                //       try {
                //         final image = await _cameraController.takePicture();
                //         debugPrint("Image saved to: ${image.path}");
                //         // Add logic to handle the captured image
                //       } catch (e) {
                //         debugPrint("Error capturing image: $e");
                //       }
                //     }
                //   },
                //   child: Text("data"),
                // ),

                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     GestureDetector(
                //         onTap: () {
                //           captureImage();
                //           setState(() {
                //             print(_imagePath);
                //           });
                //         },
                //         child: Image.asset(
                //           "assets/images/confirm.png",
                //           height: 57,
                //         )),
                //     GestureDetector(
                //         onTap: () {
                //           _cameraController.dispose();
                //           initializeCamera();
                //         },
                //         child: Image.asset(
                //           "assets/images/retake.png",
                //           height: 57,
                //         )),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/kyc_identity_image_preview.dart';

import '../constants/screen_size.dart';

class KycIdentityCameraPage extends StatefulWidget {
  const KycIdentityCameraPage({super.key});

  @override
  State<KycIdentityCameraPage> createState() => _KycIdentityCameraPageState();
}

class _KycIdentityCameraPageState extends State<KycIdentityCameraPage> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  bool _isCameraInitialized = false;
  String? _imagePath;
  @override
  void initState() {
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
                child: KycIdentityImagePreview(
                  imagePath: file.path,
                ),
                type: PageTransitionType.rightToLeftWithFade));
      }
    } catch (e) {
      debugPrint("Error capturing image: $e");
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/kyc/kyc - proof of identity.png",
                  height: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Confirm enter proof of identity is visible and clear",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 490,
                  width: 450,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(color: Colors.white70),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _isCameraInitialized
                      ? Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                  height: 490,
                                  width: 450,
                                  child: CameraPreview(_cameraController)),
                            ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
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
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        onTap: () {
                          captureImage();
                          setState(() {
                            print(_imagePath);
                          });
                        },
                        child: Image.asset(
                          "assets/images/confirm.png",
                          height: 57,
                        )),
                    GestureDetector(
                        onTap: () {
                          _cameraController.dispose();
                          initializeCamera();
                        },
                        child: Image.asset(
                          "assets/images/retake.png",
                          height: 57,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

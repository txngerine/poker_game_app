import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/kyc_image_preview_page.dart';

import '../constants/screen_size.dart';

class KycVerifyCameraPage extends StatefulWidget {
  const KycVerifyCameraPage({super.key});

  @override
  State<KycVerifyCameraPage> createState() => _KycVerifyCameraPageState();
}

class _KycVerifyCameraPageState extends State<KycVerifyCameraPage> {
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
                child: KycImagePreviewPage(
                  imagePath: file.path,
                ),
                type: PageTransitionType.rightToLeftWithFade));
      }
    } catch (e) {
      debugPrint("Error capturing image: $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose(); // Dispose the camera controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: ScreenSize.screenWidth,
            height: ScreenSize.screenHeight,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/kyc/proof of rewsidence.png",
                  height: 55,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Make sure that everything is clearly readable in this photo.\nMake sure all four corners of the document are visible.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
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
                            // Align(
                            //   alignment: Alignment.bottomCenter,
                            //   child: Container(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 20),
                            //     width: MediaQuery.of(context).size.width,
                            //     child:
                            //   ),
                            // ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                ),
                const SizedBox(height: 20),
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

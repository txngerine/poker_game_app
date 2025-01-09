import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'image_preview_screen.dart';

class FrontCameraPage extends StatefulWidget {
  const FrontCameraPage({super.key});

  @override
  State<FrontCameraPage> createState() => _FrontCameraPageState();
}

class _FrontCameraPageState extends State<FrontCameraPage> {
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
        (camera) => camera.lensDirection == CameraLensDirection.front,
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
                child: ImagePreviewScreen(imagePath: file.path),
                type: PageTransitionType.rightToLeftWithFade));
      }
    } catch (e) {
      debugPrint("Error capturing image: $e");
    }
  }

  @override
  void dispose() {
    if (_isCameraInitialized) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4E0E1),
      body: _isCameraInitialized
          ? Stack(
              children: [
                SizedBox(
                    height: 670,
                    width: 800,
                    child: CameraPreview(_cameraController)),
                Padding(
                  padding: const EdgeInsets.only(top: 83),
                  child: Image.asset(
                    'assets/images/person outline.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
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
                        const SizedBox(height: 10),
                        GestureDetector(
                            onTap: () {
                              _cameraController.dispose();
                              initializeCamera();
                            },
                            child: Image.asset(
                              "assets/images/retake.png",
                              height: 57,
                            )),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
    );
  }
}

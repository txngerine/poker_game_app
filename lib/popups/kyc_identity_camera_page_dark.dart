import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/p_y_i_image_preview_screen.dart';

import '../constants/screen_size.dart';
import '../model/login_response_model.dart';

class KycVerifyCameraPageDark extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const KycVerifyCameraPageDark({super.key, this.playerResponse});

  @override
  State<KycVerifyCameraPageDark> createState() =>
      _KycVerifyCameraPageDarkState();
}

class _KycVerifyCameraPageDarkState extends State<KycVerifyCameraPageDark> {
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
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: PYIImagePreviewScreen(
                  playerResponse: widget.playerResponse,
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: ScreenSize.screenWidth,
            height: ScreenSize.screenHeight,
            child: Image.asset(
              "assets/images/lobby/lobby pattern.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height / 1.15,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _isCameraInitialized
                      ? Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                  height: height,
                                  width: width,
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
                    // GestureDetector(
                    //     onTap: () {
                    //       captureImage();
                    //       setState(() {
                    //         print(_imagePath);
                    //       });
                    //     },
                    //     child: Image.asset(
                    //       "assets/images/confirm.png",
                    //       height: 57,
                    //     )),
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
                                // Navigator.push(
                                //   context,
                                //   PageTransition(
                                //     child: ImagePreviewScreenDark(
                                //         imagePath: _imagePath.toString()),
                                //     type: PageTransitionType.rightToLeftWithFade,
                                //   ),
                                // );
                                setState(() {
                                  print(_imagePath);
                                });
                              },
                              child: Image.asset(
                                "assets/images/shutter_button_black.png",
                                height: height / 11,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),

                    // GestureDetector(
                    //     onTap: () {
                    //       _cameraController.dispose();
                    //       initializeCamera();
                    //     },
                    //     child: Image.asset(
                    //       "assets/images/retake.png",
                    //       height: 57,
                    //     )),
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

// import 'dart:io';
// import 'dart:math' as math;

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:path_provider/path_provider.dart';

// import 'identitypreview.dart';

// class FaceIdentityPage extends StatefulWidget {
//   const FaceIdentityPage({super.key});

//   @override
//   State<FaceIdentityPage> createState() => _FaceIdentityPageState();
// }

// class _FaceIdentityPageState extends State<FaceIdentityPage> {
//   late CameraController _cameraController;
//   late List<CameraDescription> cameras;
//   bool _isCameraInitialized = false;
//   String? _imagePath;

//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }

//   Future<void> initializeCamera() async {
//     try {
//       cameras = await availableCameras();
//       CameraDescription frontCamera = cameras.firstWhere(
//         (camera) => camera.lensDirection == CameraLensDirection.front,
//       );
//       _cameraController = CameraController(
//         frontCamera,
//         ResolutionPreset.low,
//         enableAudio: false,
//         imageFormatGroup: ImageFormatGroup.jpeg,
//       );

//       await _cameraController.initialize();
//       setState(() {
//         _isCameraInitialized = true;
//       });
//     } catch (e) {
//       debugPrint("Error initializing camera: $e");
//     }
//   }

//   Future<void> captureImage() async {
//     if (!_cameraController.value.isInitialized ||
//         _cameraController.value.isTakingPicture) {
//       debugPrint("Camera not ready or already capturing.");
//       return;
//     }

//     try {
//       final XFile file = await _cameraController.takePicture();

//       if (file.path.isNotEmpty) {
//         // Get the app's documents directory
//         final Directory appDocDir = await getApplicationDocumentsDirectory();
//         final String imagesDirPath = '${appDocDir.path}/images';

//         // Create the directory if it doesn't exist
//         final Directory imagesDir = Directory(imagesDirPath);
//         if (!await imagesDir.exists()) {
//           await imagesDir.create(recursive: true);
//         }

//         // Define the new image path
//         final String newImagePath =
//             '$imagesDirPath/${DateTime.now().millisecondsSinceEpoch}.png';
//         print("00000000000000000");
//         print(newImagePath);

//         // Copy the captured image to the new directory
//         final File newImageFile = File(newImagePath);
//         await newImageFile.writeAsBytes(await file.readAsBytes());

//         setState(() {
//           _imagePath = newImagePath;
//         });

//         debugPrint("Image captured at path: $newImagePath");
//         // Navigate to ImagePreviewScreen with the new image path
//         Navigator.push(
//           context,
//           PageTransition(
//             child: ImagePreviewScreenDark(imagePath: newImagePath),
//             type: PageTransitionType.rightToLeftWithFade,
//           ),
//         );
//       }
//     } catch (e) {
//       debugPrint("Error capturing image: $e");
//     }
//   }

//   @override
//   void dispose() {
//     if (_isCameraInitialized) {
//       _cameraController.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     return Scaffold(
//       backgroundColor: const Color(0xffE4E0E1),
//       body: _isCameraInitialized
//           ? Stack(
//               children: [
//                 SizedBox(
//                     height: height / 1.2,
//                     width: width,
//                     child: Transform(
//                         alignment: Alignment.center,
//                         transform: Matrix4.rotationY(math.pi),
//                         child: CameraPreview(_cameraController))),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 105),
//                   child: Image.asset(
//                     'assets/images/person outline.png',
//                     fit: BoxFit.cover,
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     width: MediaQuery.of(context).size.width,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         GestureDetector(
//                             onTap: () {
//                               captureImage();
//                               setState(() {
//                                 print(_imagePath);
//                               });
//                             },
//                             child: Image.asset(
//                               "assets/images/shutter_button_white.png",
//                               height: height / 9,
//                             )),
//                         // const SizedBox(height: 10),
//                         // GestureDetector(
//                         //     onTap: () {
//                         //       _cameraController.dispose();
//                         //       initializeCamera();
//                         //     },
//                         //     child: Image.asset(
//                         //       "assets/images/retake.png",
//                         //       height: 57,
//                         //     )),
//                         const SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : const Center(
//               child: CircularProgressIndicator(color: Colors.white),
//             ),
//     );
//   }
// }





import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';

import 'identitypreview.dart';

class FaceIdentityPage extends StatefulWidget {
  const FaceIdentityPage({super.key});

  @override
  State<FaceIdentityPage> createState() => _FaceIdentityPageState();
}

class _FaceIdentityPageState extends State<FaceIdentityPage> {
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
        ResolutionPreset.low,
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
        final Directory appDocDir = await getApplicationDocumentsDirectory();
        final String imagesDirPath = '${appDocDir.path}/images';

        final Directory imagesDir = Directory(imagesDirPath);
        if (!await imagesDir.exists()) {
          await imagesDir.create(recursive: true);
        }

        final String newImagePath =
            '$imagesDirPath/${DateTime.now().millisecondsSinceEpoch}.png';

        final File newImageFile = File(newImagePath);
        await newImageFile.writeAsBytes(await file.readAsBytes());

        setState(() {
          _imagePath = newImagePath;
        });

        debugPrint("Image captured at path: $newImagePath");

        Navigator.push(
          context,
          PageTransition(
            child: ImagePreviewScreenDark(imagePath: newImagePath),
            type: PageTransitionType.rightToLeftWithFade,
          ),
        );
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
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: _isCameraInitialized
          ? Stack(
              children: [
                // Background Image
                SizedBox(
                  height: height,
                  width: width,
                  child: Image.asset(
                    'assets/images/lobby/lobby pattern.png', // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
                // Camera Preview (flipped for front cam)
                SizedBox(
                  height: height / 1.2,
                  width: width,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: CameraPreview(_cameraController),
                  ),
                ),
                // Overlay outline image
                Padding(
                  padding: const EdgeInsets.only(top: 105),
                  child: Image.asset(
                    'assets/images/protrait_outline.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                // Capture Button
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
                            "assets/images/shutter_button_black.png",
                            height: height / 9,
                          ),
                        ),
                        const SizedBox(height: 10),
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

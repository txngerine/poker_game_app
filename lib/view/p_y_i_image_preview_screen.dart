import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../constants/screen_size.dart';
import '../model/login_response_model.dart';
import '../popups/kyc_identity_camera_page_dark.dart';
import '../provider/login_provider.dart';
import 'lobby_page.dart';

class PYIImagePreviewScreen extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  final String imagePath;

  const PYIImagePreviewScreen(
      {super.key, required this.imagePath, this.playerResponse});

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

  // Future<void> uploadImage() async {
  //   try {
  //     setState(() {
  //       isUploading = true;
  //     });
  //     //convert image to base64
  //     String base64String = base64Encode(_imageFile.readAsBytesSync());
  //     _base64String = base64String;
  //     // log("Base64 String: $_base64String");
  //     //get userId
  //     String? userId = Provider.of<LoginProvider>(context, listen: false)
  //         .playerId
  //         ?.toString();
  //     print("id form login response:$userId");
  //     String apiUrl =
  //         "http://3.6.170.253:1080/server.php/api/v1/player/save-id/$userId?XDEBUG_SESSION_START=netbeans-xdebug";
  //     print("url...${apiUrl}");
  //     Map<String, dynamic> requestBody = {
  //       "photo": base64String,
  //       "id": userId,
  //       "deviceId": 1
  //     };
  //     print("00000");
  //     print(apiUrl);
  //     print(userId);
  //     print(requestBody["id"]);
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(requestBody),
  //     );
  //
  //     // log("Response: ${response.body}");
  //
  //     // Check response
  //     if (response.statusCode == 200) {
  //       print("Image uploaded successfully: ${response.body}");
  //       Navigator.pushReplacement(
  //         context,
  //         PageTransition(
  //           child: LobbyPage(
  //             playerResponse: widget.playerResponse!,
  //           ),
  //           type: PageTransitionType.rightToLeftWithFade,
  //         ),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           elevation: 10,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(24),
  //           ),
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: CupertinoColors.activeGreen,
  //           content: const Text(
  //             "Image uploaded successfully!",
  //             style: TextStyle(color: Colors.white),
  //           )));
  //     } else {
  //       log("Failed to upload image: statusCode =${response.statusCode}");
  //
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           elevation: 10,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(24),
  //           ),
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: CupertinoColors.destructiveRed,
  //           content: const Text(
  //             "ID not detected. Please ensure your ID is clearly visible.",
  //             style: TextStyle(color: Colors.white),
  //           )));
  //     }
  //   } catch (e) {
  //     log("Error uploading image: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Failed to upload image.")),
  //     );
  //   } finally {
  //     setState(() {
  //       isUploading = false;
  //     });
  //   }
  // }

  Future<void> uploadImage() async {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select an image first.")),
      );
      return;
    }

    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final playerId = loginProvider.playerId;

    if (playerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("User ID not available. Please login again.")),
      );
      return;
    }

    setState(() => isUploading = true);

    final success = await loginProvider
        .uploadIdImage(_imageFile!); // now it's safe to use !

    setState(() => isUploading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: LobbyPage(
            playerResponse: loginProvider.playerDetails!,
            playerBalance:
                loginProvider.playerDetails?.data?.balance.toString(),
            kycStatus: Map<String, String>.from(loginProvider.kycStatus),
            avatarStatus: Map<String, String>.from(loginProvider.updateAvatar),
            avatar: loginProvider.playerDetails?.data?.lobbyAvatar ?? "",
          ),
          type: PageTransitionType.rightToLeftWithFade,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: const Text(
            "Image uploaded successfully!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: const Text(
            "ID not detected. Please ensure your ID is clearly visible.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
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
                image: AssetImage("assets/images/lobby/lobby pattern.png"),
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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const KycVerifyCameraPageDark(),
                          ));
                    },
                    child: Image.asset(
                      "assets/images/retake (6).png",
                      width: width / 2.3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadImage();
                    },
                    child: isUploading
                        ? SizedBox(
                            width: width / 2.3,
                            child: const Center(
                                child: CircularProgressIndicator()))
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

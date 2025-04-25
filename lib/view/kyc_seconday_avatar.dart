import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/kyc_pick_secondary_avatar.dart';

import '../model/login_response_model.dart';
import '../widget/build_heading_widget.dart';
import 'lobby_page.dart';

class KycSecondaryAvatar extends StatefulWidget {
  final String selectedImageUrl;
  final LoginResponseModel? playerResponse;

  const KycSecondaryAvatar(
      {super.key, required this.selectedImageUrl, this.playerResponse});

  @override
  State<KycSecondaryAvatar> createState() => _KycSecondaryAvatarState();
}

class _KycSecondaryAvatarState extends State<KycSecondaryAvatar> {
  bool isLoading = false;

  Future<void> chooseAvatar() async {
    setState(() {
      isLoading = true;
    });

    final userId = widget.playerResponse?.data?.id?.toString();
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User ID is missing')),
      );
      setState(() => isLoading = false);
      return;
    }

    final url =
        "http://3.6.170.253:1080/server.php/api/v1/avatar-choose/$userId?XDEBUG_SESSION_START=netbeans-xdebug";

    try {
      final response = await Dio().post(
        url,
        data: {"secondary": widget.selectedImageUrl},
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 &&
          response.data["status"].toString().toUpperCase() == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Avatar uploaded successfully")),
        );
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: LobbyPage(
              playerResponse: widget.playerResponse!,
            ),
            type: PageTransitionType.rightToLeftWithFade,
          ),
          (route) => false, // Remove all previous routes
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to upload avatar')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('An error occurred while uploading avatar')),
      );
    } finally {
      setState(() => isLoading = false);
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
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/lobby/lobby pattern.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 50),
            child: Container(
              width: width / 1.2,
              height: height / 1.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/avatar_new/avatar_content_field (1).png"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  const BuildHeadingWidget(
                    text: "Pick Secondary Avatar",
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 60),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/pokerPadArt/golden selection frame.png",
                        height: 470,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.network(
                          widget.selectedImageUrl,
                          height: 452,
                          width: 360,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 60,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const KycPickSecondaryAvatar(),
                          type: PageTransitionType.leftToRightWithFade,
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/avatar_new/change_avatar_button (1).png",
                      width: width / 2.5,
                    ),
                  ),
                  isLoading
                      ? SizedBox(
                          width: width / 2.5,
                          child:
                              const Center(child: CircularProgressIndicator()))
                      : GestureDetector(
                          onTap: chooseAvatar,
                          child: Image.asset(
                            "assets/images/avatar_new/submit_button_black (1).png",
                            width: width / 2.5,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

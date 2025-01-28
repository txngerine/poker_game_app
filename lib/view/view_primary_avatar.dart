import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/choose_avatar_controller.dart';
import 'package:pokerpad/model/choose_avatar_request_model.dart';
import 'package:pokerpad/model/choose_avatar_response_model.dart';
import 'package:pokerpad/view/pick_avatar_page.dart';
import 'package:pokerpad/view/pick_secondary_avatar.dart';

class ViewPrimaryAvatar extends StatefulWidget {
  final String selectedImageUrl;

  const ViewPrimaryAvatar({super.key, required this.selectedImageUrl});

  @override
  State<ViewPrimaryAvatar> createState() => _ViewPrimaryAvatarState();
}

class _ViewPrimaryAvatarState extends State<ViewPrimaryAvatar> {
  bool isLoading = false;
  final ChooseAvatarController _chooseAvatarController =
      ChooseAvatarController();
  Future<void> chooseAvatar() async {
    setState(() {
      isLoading = true;
    });
    try {
      ChooseAvatarRequestModel requestModel =
          ChooseAvatarRequestModel(primary: widget.selectedImageUrl);
      ChooseAvatarResponseModel? responseModel =
          await _chooseAvatarController.chooseAvatar(requestModel);
      if (responseModel != null && responseModel.status == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 350),
            content:
                Text("Avatar upload successfully ${responseModel.status}")));
        Navigator.push(
            context,
            PageTransition(
                child: const PickSecondaryAvatar(),
                type: PageTransitionType.rightToLeftWithFade));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to upload avatar'),
            duration: Duration(milliseconds: 400),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while uploading avatar'),
          duration: Duration(milliseconds: 400),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                      width: 400,
                      "assets/images/pokerPadArt/pick your primary avatar title.png"),
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Frame Image
                      Image.asset(
                        "assets/images/pokerPadArt/golden selection frame.png",
                        height: 470,
                        // width: 280,
                      ),
                      // Avatar Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            9), // Ensure image fits within the frame's radius
                        child: Image.network(
                          widget.selectedImageUrl,
                          height: 452,
                          width: 360,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const PickAvatarPage(),
                              type: PageTransitionType.leftToRightWithFade));
                    },
                    child: Image.asset(
                        width: MediaQuery.of(context).size.width / 1.3,
                        "assets/images/pokerPadArt/change avatar button.png"),
                  ),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : GestureDetector(
                          onTap: () {
                            chooseAvatar();
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         child: PickSecondaryAvatar(),
                            //         type: PageTransitionType.leftToRightWithFade));
                          },
                          child: Image.asset(
                              width: MediaQuery.of(context).size.width / 1.3,
                              "assets/images/pokerPadArt/proceed to secondary avatar button.png"),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/pokerPadArt/retake selfie.png",
                    height: 15,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

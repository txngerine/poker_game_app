import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/front_camera_page.dart';

import '../constants/screen_size.dart';

class ImageScrollPage extends StatefulWidget {
  const ImageScrollPage({super.key});

  @override
  State<ImageScrollPage> createState() => _ImageScrollPageState();
}

class _ImageScrollPageState extends State<ImageScrollPage> {
  final PageController _pageController = PageController();
  bool _showButton = false;
  //added comment
  // String? selectGender;
  // bool isLoading = false;
  // bool genderImage = false;
  // final GenderController _genderController = GenderController();
  //
  // void genderSelect(String gender) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   // Create request model
  //   PlayersGenderRequestModel request = PlayersGenderRequestModel(
  //     gender: gender,
  //     deviceId: 1,
  //     id: SignupController.userId!.toInt(),
  //   );
  //
  //   // Fetch response
  //   PlayersGenderResponseModel? response =
  //       await _genderController.gender(request);
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  //   if (response != null && response.status == "OK") {
  //     print(response.status);
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         duration: const Duration(milliseconds: 350),
  //         elevation: 10,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(24),
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: CupertinoColors.activeGreen,
  //         content: Text(
  //             "Success! Step: ${response.data!.step}, ID: ${response.data!.id}"),
  //       ),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         elevation: 10,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(24),
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: CupertinoColors.destructiveRed,
  //         content: Text("Error: ${response?.message ?? 'Unknown error'}"),
  //       ),
  //     );
  //   }
  // }

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
            child: SizedBox(
              width: double.infinity,
              height: double.maxFinite,
              // color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _showButton = (index == 4);
                        });
                      },
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/9. Instruction - light copy.png',
                              fit: BoxFit.cover,
                            ),
                            // Row(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               selectGender = "male";
                            //               genderImage = false;
                            //             });
                            //             genderSelect("M");
                            //           },
                            //           child: selectGender == "male"
                            //               ? Image.asset(
                            //                   "assets/images/Artboard 41.png",
                            //                   width: 30)
                            //               : Image.asset(
                            //                   "assets/images/empty checkmark.png",
                            //                   width: 30),
                            //         ),
                            //         const SizedBox(width: 20),
                            //         const BuildTextWidget(text: "Male    ")
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               selectGender = "female";
                            //               genderImage = false;
                            //             });
                            //             genderSelect("F");
                            //           },
                            //           child: selectGender == "female"
                            //               ? Image.asset(
                            //                   "assets/images/Artboard 41.png",
                            //                   width: 30)
                            //               : Image.asset(
                            //                   "assets/images/empty checkmark.png",
                            //                   width: 30),
                            //         ),
                            //         const SizedBox(width: 20),
                            //         const BuildTextWidget(
                            //           text: "Female",
                            //         )
                            //       ],
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/10. instruction - accessories copy.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/11. instruction - hair copy.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/12. instrucions - focus copy.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/13. instruction - posture copy.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  if (_showButton)
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const FrontCameraPage(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                        child: Image.asset(
                          "assets/images/take a selfie.png",
                          height: 55,
                        )),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

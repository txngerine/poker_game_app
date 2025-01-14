import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/gender_controller.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/players_gender_request_model.dart';
import 'package:pokerpad/model/players_gender_response_model.dart';
import 'package:pokerpad/view/image_scroll_page.dart';
import 'package:pokerpad/widget/build_bold_text_widget.dart';
import 'package:pokerpad/widget/build_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  String? selectGender;
  bool isLoading = false;
  final GenderController _genderController = GenderController();

  void genderSelect(String gender) async {
    setState(() {
      isLoading = true;
    });

    // Create request model
    PlayersGenderRequestModel request = PlayersGenderRequestModel(
      gender: gender,
      deviceId: 1,
      id: SignupController.userId!.toInt(),
    );

    // Fetch response
    PlayersGenderResponseModel? response =
        await _genderController.gender(request);

    setState(() {
      isLoading = false;
    });

    if (response != null && response.status == "OK") {
      print(response.status);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: CupertinoColors.activeGreen,
          content: Text(
              "Success! Step: ${response.data!.step}, ID: ${response.data!.id}"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: CupertinoColors.destructiveRed,
          content: Text("Error: ${response?.message ?? 'Unknown error'}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BuildHeadingText(text: "Create Your Avatar"),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 590,
                    width: 430,
                    child: Card(
                      shadowColor: const Color(0xffB7B7B7),
                      elevation: 30,
                      color: const Color(0xffE4E0E1),
                      shape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffB7B7B7)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BuildBoldTextWidget(
                                    text: "Step 1 : Select your gender"),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectGender = "male";
                                        });
                                        genderSelect("M");
                                      },
                                      child: selectGender == "male"
                                          ? Image.asset(
                                              "assets/images/Artboard 41.png",
                                              width: 30)
                                          : Image.asset(
                                              "assets/images/empty checkmark.png",
                                              width: 30),
                                    ),
                                    const SizedBox(width: 20),
                                    const BuildTextWidget(text: "Male    ")
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/gender.png",
                                    height: 50),
                                const Spacer(),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectGender = "female";
                                        });
                                        genderSelect("F");
                                      },
                                      child: selectGender == "female"
                                          ? Image.asset(
                                              "assets/images/Artboard 41.png",
                                              width: 30)
                                          : Image.asset(
                                              "assets/images/empty checkmark.png",
                                              width: 30),
                                    ),
                                    const SizedBox(width: 20),
                                    const BuildTextWidget(text: "Female")
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildBoldTextWidget(
                                    text: "Step 2 : Take a Selfie"),
                                BuildTextWidget(text: "Receive your Avatar")
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.grey, width: 3.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      "https://t4.ftcdn.net/jpg/06/11/31/83/360_F_611318347_W9VlSC14WGljlV5K3BP1zEShcr1Dvoq5.jpg",
                                      width: 170,
                                      height: 190,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: Colors.grey, width: 3.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      "https://starryai.com/cdn-cgi/image/format=avif,quality=90/https://cdn.prod.website-files.com/61554cf069663530fc823d21/6369fed004b5b041b7ed686a_download-8-min.png",
                                      width: 170,
                                      height: 190,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffFFC94A),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              height: 150,
                              width: 580,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    BuildBoldTextWidget(
                                        text: "Facial Verification"),
                                    Expanded(
                                      child: BuildTextWidget(
                                          align: TextAlign.center,
                                          text:
                                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum "),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () {
                            if (selectGender != null) {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: const ImageScrollPage(),
                                  type: PageTransitionType.rightToLeftWithFade,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor:
                                      CupertinoColors.destructiveRed,
                                  content: const Text(
                                      "Please select a gender first."),
                                ),
                              );
                            }
                          },
                          child: Image.asset("assets/images/take a selfie.png",
                              width: 570, height: 60),
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

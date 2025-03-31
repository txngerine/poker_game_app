import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/gender_controller.dart';
import '../../controller/signup_controller.dart';
import '../../model/players_gender_request_model.dart';
import '../../model/players_gender_response_model.dart';
import '../../widget/build_heading_widget.dart';
import '../../widget/build_text_widget.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectGender;
  bool isLoading = false;
  bool genderImage = false;
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
          duration: const Duration(milliseconds: 350),
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
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/gender&avatar/log-reg frame.png',
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              BuildHeadingWidget(text: "Gender"),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                  width: width / 5,
                  "assets/images/gender&avatar/gender icon.png"),
              SizedBox(
                height: 100,
              ),
              BuildTextWidget(
                text: "select your gender",
                fontSize: 20,
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectGender = "male";
                            genderImage = false;
                          });
                          genderSelect("M");
                        },
                        child: selectGender == "male"
                            ? Image.asset("assets/images/Artboard 41.png",
                                width: 30)
                            : Image.asset("assets/images/empty checkmark.png",
                                width: 30),
                      ),
                      const BuildTextWidget(text: "Male    ")
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectGender = "female";
                            genderImage = false;
                          });
                          genderSelect("F");
                        },
                        child: selectGender == "female"
                            ? Image.asset("assets/images/Artboard 41.png",
                                width: 30)
                            : Image.asset("assets/images/empty checkmark.png",
                                width: 30),
                      ),
                      const BuildTextWidget(
                        text: "Female",
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_full.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

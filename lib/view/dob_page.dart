import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/dob_controller.dart';
import 'package:pokerpad/model/dob_request_model.dart';
import 'package:pokerpad/model/dob_response_model.dart';
import 'package:pokerpad/view/terms_page.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';
import '../widget/build_text_field_widget.dart';

class DobPage extends StatefulWidget {
  const DobPage({super.key});

  @override
  State<DobPage> createState() => _DobPageState();
}

class _DobPageState extends State<DobPage> {
  bool rememberButton = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController();
  bool isLoading = false;
  final DobController _dobController = DobController();
  Future<void> getDob() async {
    if (!rememberButton) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please confirm that your real date of birth'),
          duration: Duration(milliseconds: 900),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      DobRequestModel request = DobRequestModel(
        dob: dobController.text,
        deviceId: 1, // Assuming deviceId is static for now
      );

      DobResponseModel? response = await _dobController.getDob(request);

      // Debug print response status
      print("Response Status: ${response?.status}");
      print("Response Data: ${response?.data}");

      if (response?.status == "OK") {
        // Navigation if the response is "OK"
        Navigator.push(
          context,
          PageTransition(
            child: const TermsPage(),
            type: PageTransitionType.rightToLeftWithFade,
          ),
        );
      } else {
        print("Failed response: ${response?.status}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed! Please enter Eg 07/09/2000.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print("Error occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          duration: const Duration(seconds: 2),
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
      resizeToAvoidBottomInset: false,
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
            child: Container(
              height: 430,
              width: 400,
              decoration: BoxDecoration(
                  color: const Color(0xffB7B7B7),
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const BuildSubHeadingText(text: "DATE OF BIRTH"),
                    const SizedBox(
                      height: 20,
                    ),
                    const BuildTextWidget(
                        align: TextAlign.center,
                        text:
                            "Due to local regulations,you need to make sure that you are at least 18 years old before using the app "),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: BuildTextFieldWidget(
                        controller: dobController,
                        hintText: "dd/mm/yyyy",
                        labelText: 'email',
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              rememberButton = !rememberButton;
                            });
                          },
                          child: rememberButton
                              ? Image.asset(
                                  "assets/images/Artboard 41.png",
                                  width: 30,
                                )
                              : Image.asset(
                                  "assets/images/empty checkmark.png",
                                  width: 30,
                                ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const BuildTextWidget(
                            align: TextAlign.center,
                            fontSize: 15,
                            text:
                                "I confirm that this is my real date of birth")
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    isLoading
                        ? const CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () {
                              getDob();
                            },
                            child: Image.asset("assets/images/confirm.png"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/controller/terms_controller.dart';
import 'package:pokerpad/model/terms_request_model.dart';
import 'package:pokerpad/model/terms_response_model.dart';
import 'package:pokerpad/view/name_page.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool checker = false;
  bool isLoading = false;
  final TermsController _termsController = TermsController();

  Future<void> acceptTerms() async {
    if (!checker) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Please confirm that you have read the Terms of Service'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      TermsRequestModel request = TermsRequestModel(
        tos: "true",
        deviceId: 1,
        id: SignupController.userId!.toInt(),
      );

      TermsResponseModel? response = await _termsController.terms(request);

      if (response != null && response.status == "OK") {
        Navigator.push(
          context,
          PageTransition(
            child: const NamePage(),
            type: PageTransitionType.rightToLeftWithFade,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Failed to accept the terms. Please try again later.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
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
              width: 400,
              height: 540,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 3,
                    color: Colors.grey,
                    blurRadius: 3.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffB7B7B7),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const BuildSubHeadingText(text: "TERMS OF SERVICE"),
                  const SizedBox(height: 5),
                  const BuildTextWidget(
                    text: "Read to the end to confirm the Terms of Service",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white70,
                      ),
                      width: 400,
                      height: 300,
                      child: const SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: BuildTextWidget(
                            fontSize: 15,
                            text: "Contrary to popular belief, Lorem Ipsum...",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            checker = !checker;
                          });
                        },
                        child: Image.asset(
                          checker
                              ? "assets/images/Artboard 41.png"
                              : "assets/images/empty checkmark.png",
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 19),
                      const BuildTextWidget(
                        text: "I confirm that I fully read the TOS Agreement",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                          ),
                          child: const Text(
                            "Decline",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 170,
                        height: 40,
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: acceptTerms,
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                child: const Text(
                                  "Accept",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                      ),
                    ],
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

import 'package:flutter/material.dart';

import 'affiliate_location_widget.dart';
import 'affiliate_phone_verification_widget.dart';
import 'build_sub_heading_text.dart';
import 'build_text_widget.dart';

class AffiliateProfileButton extends StatefulWidget {
  const AffiliateProfileButton({super.key});

  @override
  State<AffiliateProfileButton> createState() => _AffiliateProfileButtonState();
}

class _AffiliateProfileButtonState extends State<AffiliateProfileButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: MediaQuery.sizeOf(context).height / 1.1,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: const Color(0xff272829),
                    borderRadius: BorderRadius.circular(
                      35,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                            width: width / 2,
                            "assets/images/Affiliate/verify phone alert/affiliate player view - image.png"),
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const BuildSubHeadingText(
                                text: "whateverman",
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(Icons.mail_outline),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  BuildTextWidget(
                                    text: "whateverman@gmail.com",
                                    color: Colors.white70,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  AffiliatePhoneVerificationWidget(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.call),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  BuildTextWidget(
                                    text: "8086433988",
                                    color: Colors.white70,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  AffiliateLocationWidget(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  BuildTextWidget(
                                    text: "Ernakulam",
                                    color: Colors.white70,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                      width: width / 2,
                                      "assets/images/Affiliate/verify phone alert/introduction.png"),
                                  Positioned(
                                    top: 10, bottom: 10,
                                    left: 20, // Adjust position as needed
                                    right: 20, // Adjust width as needed
                                    child: Material(
                                      color: Colors.transparent,
                                      child: TextField(
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.white70),
                                        decoration: InputDecoration(
                                          hintMaxLines: 6,
                                          hintText:
                                              "Introduce yourself.Which local casinos do you frequent and which games do you usually play? invite your players to reach out to you in case they need any type of assistance!",
                                          hintStyle: const TextStyle(
                                              color: Colors.white70),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/Affiliate/verify phone alert/contact preferences.png",
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10, bottom: 10,
                          left: 20, // Adjust position as needed
                          right: 20, // Adjust width as needed
                          child: Material(
                            color: Colors.transparent,
                            child: TextField(
                              style: const TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                hintText:
                                    "What is the best way to contact you? Do you have whatsapp",
                                hintStyle:
                                    const TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                        "assets/images/Affiliate/verify phone alert/disclaimer.png")
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Image.asset(
        "assets/images/Affiliate/profile button passive (2).png",
        width: width / 10,
      ),
    );
  }
}

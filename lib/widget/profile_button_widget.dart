import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';
import 'build_text_widget.dart';

class ProfileButtonWidget extends StatefulWidget {
  const ProfileButtonWidget({super.key});

  @override
  State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
}

class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Dialog(
      child: Container(
        height: height / 2.3,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildSubHeadingText(
                    text: "WhatEverMan",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  Spacer(),
                  BuildSubHeadingText(
                    text: "ID:",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.mail,
                    color: Colors.white,
                    size: 12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  BuildTextWidget(
                    text: "whateverman@gmail.com",
                    color: Colors.white,
                    fontSize: 12,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const BuildTextWidget(
                    text: "Enter your mobile number",
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width / 3,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white)),
                        onPressed: () {},
                        child: const BuildSubHeadingText(
                          text: "change avatar",
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const BuildSubHeadingText(
                        fontSize: 15,
                        text: "FACIAL VERIFICATION",
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width / 3,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xff3C3D37))),
                            onPressed: () {},
                            child: const BuildSubHeadingText(
                              text: "pending",
                              fontSize: 12,
                              color: Colors.white70,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const BuildSubHeadingText(
                        fontSize: 15,
                        text: "PROOF OF IDENTITY",
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width / 3,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xff79D7BE))),
                            onPressed: () {},
                            child: const BuildSubHeadingText(
                              text: "verified",
                              fontSize: 12,
                              color: Colors.white70,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const BuildSubHeadingText(
                        fontSize: 15,
                        text: "PROOF OF ADDRESS",
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width / 3,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xffB43F3F))),
                            onPressed: () {},
                            child: const BuildSubHeadingText(
                              text: "rejected",
                              fontSize: 12,
                              color: Colors.white70,
                            )),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        color: const Color(0xff424242),
                        width: width / 3,
                      ),
                      SizedBox(
                        width: width / 3,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: const BuildSubHeadingText(
                              text: "try again",
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

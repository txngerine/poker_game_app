import 'package:flutter/material.dart';

import 'custom_text_field_widget.dart';

class AffiliatePlayersSection extends StatefulWidget {
  const AffiliatePlayersSection({super.key});

  @override
  State<AffiliatePlayersSection> createState() =>
      _AffiliatePlayersSectionState();
}

class _AffiliatePlayersSectionState extends State<AffiliatePlayersSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(
          "assets/images/Affiliate/no. of players placeholder.png",
          width: width / 2,
        ),
        Positioned(
          left: width / 2.5,
          bottom: height / 14,
          child: const Text(
            "394",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          left: width / 20,
          top: height / 17,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/Affiliate/Aff History Button .png",
                  width: width / 5,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Dialog(
                          alignment: Alignment.topCenter,
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height / 2,
                            width: MediaQuery.sizeOf(context).width,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/cashier/withdraw/deposit frame.png',
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        children: [
                                          Column(
                                            children: [
                                              CustomTextFieldWidget(
                                                  hintText:
                                                      "Transfer to player ID:"),
                                              CustomTextFieldWidget(
                                                  hintText:
                                                      "Transfer Amount\$:"),
                                              CustomTextFieldWidget(
                                                  hintText: "Password"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3,
                                              "assets/images/cashier/withdraw/forgot password.png"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        2.7,
                                                "assets/images/cashier/withdraw/cancel button.png"),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.7,
                                              "assets/images/cashier/withdraw/withdraw button.png")
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Image.asset(
                  "assets/images/Affiliate/Aff Transfer Button.png",
                  width: width / 5,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

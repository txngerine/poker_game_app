import 'package:flutter/material.dart';
import 'package:pokerpad/view/history_button_view.dart';

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
                onTap: () {
                  print("history button clicked");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryButtonView(),
                      ));
                },
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
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              const CustomTextFieldWidget(
                                                  hintText:
                                                      "Transfer to player ID:"),
                                              const CustomTextFieldWidget(
                                                  hintText:
                                                      "Transfer Amount\$:"),
                                              const CustomTextFieldWidget(
                                                  hintText: "Password"),
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          3,
                                                  "assets/images/cashier/withdraw/forgot password.png"),
                                              SizedBox(
                                                height: height / 14,
                                              ),
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          2.7,
                                                  "assets/images/cashier/deposit/Alert placeholder.png"),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black,
                                            ),
                                            width: width / 3,
                                            height: height / 3.3,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: height / 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2, right: 2),
                                                  child: Image.asset(
                                                      width: width / 3,
                                                      // height: height / 3.3,
                                                      fit: BoxFit.contain,
                                                      "assets/images/person outline.png"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      // Row(
                                      //   children: [],
                                      // ),
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

import 'package:flutter/material.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/custom_transfer_text_field.dart';

class AffiliatePlayerTransferWidget extends StatefulWidget {
  const AffiliatePlayerTransferWidget({super.key});

  @override
  State<AffiliatePlayerTransferWidget> createState() =>
      _AffiliatePlayerTransferWidgetState();
}

class _AffiliatePlayerTransferWidgetState
    extends State<AffiliatePlayerTransferWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset("assets/images/Affiliate/player-view/transfer bg.png"),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 40),
            child: Column(
              children: [
                SizedBox(
                  height: height / 2.8,
                  width: width / 1.15,
                  child: Row(
                    children: [
                      Image.asset(
                          "assets/images/Affiliate/player-view/avatar plavceholder.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          BuildSubHeadingText(
                            text: "TRANSFER \$ TO \n WHATEVERMAN",
                            color: Colors.white70,
                            fontSize: 19,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BuildSubHeadingText(
                            text: "MY BALANCE \n \$10,923,00",
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTransferTextField(hintText: "Transfer Amount"),
                          CustomTransferTextField(
                            hintText: "Password",
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width / 1.15,
                  height: height / 15,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 2.5,

                        // Image.asset(
                        //     width: width / 2.5,
                        //     "assets/images/Affiliate/player-view/transfer alert balance.png"),
                      ),
                      SizedBox(
                        width: width / 9,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "forgot password?",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                          Text(
                            "remember password?",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width / 1.15,
                  height: height / 15,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                            width: width / 2.3,
                            "assets/images/Affiliate/player-view/cancel button.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                  child: Stack(
                                children: [
                                  Image.asset(
                                      "assets/images/Affiliate/player-view/trasfer successful popup.png"),
                                  Positioned(
                                    top: height / 4.1,
                                    left: width / 5.9,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                          ..pop() // Close the dialog
                                          ..pop(); // Navigate back to the lobby page
                                      },
                                      child: Image.asset(
                                          width: width / 2,
                                          "assets/images/Affiliate/player-view/ok button (1).png"),
                                    ),
                                  )
                                ],
                              ));
                            },
                          );
                        },
                        child: Image.asset(
                            width: width / 2.3,
                            "assets/images/Affiliate/player-view/transfer button.png"),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

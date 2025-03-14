import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';
import 'custom_transfer_text_field.dart';

class AffiliatePlayerRequestWidget extends StatefulWidget {
  const AffiliatePlayerRequestWidget({super.key});

  @override
  State<AffiliatePlayerRequestWidget> createState() =>
      _AffiliatePlayerRequestWidgetState();
}

class _AffiliatePlayerRequestWidgetState
    extends State<AffiliatePlayerRequestWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                  "assets/images/Affiliate/player-view/transfer bg.png"),
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
                                text: "REQUEST \$ TO \n WHATEVERMAN",
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
                              CustomTransferTextField(
                                hintText: "Amount \$",
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 12,
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
                              Navigator.pop(context);
                            },
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                        child: Stack(
                                      children: [
                                        Image.asset(
                                            "assets/images/Affiliate/player-view/request successful pop up .png"),
                                        Positioned(
                                          top: height / 4.1,
                                          left: width / 8,
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
                                  "assets/images/Affiliate/player-view/Request button.png"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                height: height / 3.5,
                "assets/images/Affiliate/player-view/disclaimer (1).png"),
          )
        ],
      ),
    );
  }
}

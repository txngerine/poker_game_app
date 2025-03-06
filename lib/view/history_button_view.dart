import 'package:flutter/material.dart';

import '../widget/build_sub_heading_text.dart';

class HistoryButtonView extends StatefulWidget {
  const HistoryButtonView({super.key});

  @override
  State<HistoryButtonView> createState() => _HistoryButtonViewState();
}

class _HistoryButtonViewState extends State<HistoryButtonView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height,
      width: width,
      color: const Color(0xff2B2B2B),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/Affiliate/history/affiliate history  screen empty.png",
                width: width,
                height: height / 1,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                            width: width / 2,
                            "assets/images/Affiliate/history/transfer history button.png"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                              width: width / 9,
                              "assets/images/Affiliate/history/close button.png"),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                            "assets/images/Affiliate/history/search bar.png"),
                        const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Align(
                            alignment: Alignment.center,
                            child: BuildSubHeadingText(
                              text: "search",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        // color: Colors.red,
                      ),
                      height: height / 1.201,
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                      "assets/images/Affiliate/2nd layer box.png"),
                                  Padding(
                                    padding: EdgeInsets.only(right: width / 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Image.asset(
                                                "assets/images/Affiliate/winning player.png",
                                                width: width / 10,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                BuildSubHeadingText(
                                                  text: "ID:#${index + 100}",
                                                  color: Colors.white70,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                                const BuildSubHeadingText(
                                                  text: "CHARLIE007",
                                                  color: Colors.white70,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w100,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const BuildSubHeadingText(
                                              text: "15:38UTC",
                                              color: Colors.white70,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w100,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const BuildSubHeadingText(
                                              text: "02/13/2025",
                                              color: Colors.white70,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w100,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            BuildSubHeadingText(
                                              text: "\$43,0${index + 24}",
                                              color: Colors.green,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w100,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

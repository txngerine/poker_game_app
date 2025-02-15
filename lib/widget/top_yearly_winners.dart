import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class TopYearlyWinners extends StatefulWidget {
  const TopYearlyWinners({super.key});

  @override
  State<TopYearlyWinners> createState() => _TopYearlyWinnersState();
}

class _TopYearlyWinnersState extends State<TopYearlyWinners> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding:
          EdgeInsets.only(left: 20, right: 20, bottom: 10, top: height / 15),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const BuildSubHeadingText(
                  text: "Top yearly winners of 2025", color: Colors.white),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Image.asset("assets/images/lobby/top winners/Hero Frame.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          width: width / 9,
                          "assets/images/lobby/top winners/Players Avatar BG.png",
                        ),
                      ),
                      const BuildSubHeadingText(
                          text: "charlie007", fontWeight: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BuildSubHeadingText(text: "  Rank", fontWeight: 10),
                          BuildSubHeadingText(text: "17", fontWeight: 14),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BuildSubHeadingText(text: "won/hour", fontWeight: 10),
                          BuildSubHeadingText(text: "\$20", fontWeight: 14),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BuildSubHeadingText(text: "winnings", fontWeight: 10),
                          BuildSubHeadingText(
                              text: "\$100,000", fontWeight: 14),
                        ],
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Container(
                    height: height / 1.28,
                    width: width / 1.2,
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Image.asset(
                                "assets/images/Affiliate/2nd layer box.png"),
                            Padding(
                              padding: EdgeInsets.only(right: width / 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      "assets/images/lobby/top winners/Players Avatar BG.png",
                                      width: width / 12,
                                    ),
                                  ),
                                  BuildSubHeadingText(
                                    text: "Charlie007",
                                    color: Colors.white,
                                    fontWeight: 12,
                                  ),
                                  BuildSubHeadingText(
                                    text: "\$100,000",
                                    color: Colors.white,
                                    fontWeight: 12,
                                  ),
                                  BuildSubHeadingText(
                                    text: "won/hour",
                                    color: Colors.white,
                                    fontWeight: 12,
                                  ),
                                  BuildSubHeadingText(
                                    text: "\$20",
                                    color: Colors.white,
                                    fontWeight: 12,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

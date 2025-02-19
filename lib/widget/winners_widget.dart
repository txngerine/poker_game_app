import 'package:flutter/material.dart';
import 'package:pokerpad/widget/monthly_winners_view_widget.dart';
import 'package:pokerpad/widget/monthly_winners_widget.dart';

import 'build_sub_heading_text.dart';

class WinnersWidget extends StatefulWidget {
  const WinnersWidget({super.key});

  @override
  State<WinnersWidget> createState() => _WinnersWidgetState();
}

class _WinnersWidgetState extends State<WinnersWidget> {
  int selectButton = 1;
  void updateContent(int buttonNumber) {
    setState(() {
      selectButton = buttonNumber;
    });
  }

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
              selectButton == 1
                  ? BuildSubHeadingText(
                      text: "Top February winners", color: Colors.white)
                  : BuildSubHeadingText(
                      text: "Top winners of 2025", color: Colors.white),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Image.asset(
                      "assets/images/lobby/top winners/Top Winners Header Button BG.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            updateContent(1);
                          },
                          child: selectButton == 1
                              ? Image.asset(
                                  width: width / 2.2,
                                  "assets/images/lobby/top winners/Monthly Winners Button Active.png",
                                )
                              : Image.asset(
                                  width: width / 2.2,
                                  "assets/images/lobby/top winners/Monthly Winners Button Passive.png",
                                ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateContent(2);
                          },
                          child: selectButton == 2
                              ? Image.asset(
                                  width: width / 2.2,
                                  "assets/images/lobby/top winners/Yearly Winners Button Active.png",
                                )
                              : Image.asset(
                                  width: width / 2.2,
                                  "assets/images/lobby/top winners/Yearly Winners Button Passive.png",
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                          text: "charlie007", fontSize: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BuildSubHeadingText(text: "  Rank", fontSize: 10),
                          BuildSubHeadingText(text: "17", fontSize: 14),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BuildSubHeadingText(text: "won/hour", fontSize: 10),
                          BuildSubHeadingText(text: "\$20", fontSize: 14),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BuildSubHeadingText(text: "winnings", fontSize: 10),
                          BuildSubHeadingText(text: "\$100,000", fontSize: 14),
                        ],
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    width: width,
                    height: height / 1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: selectButton == 1
                        ? MonthlyWinnersViewWidget()
                        : MonthlyWinnersWidget()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

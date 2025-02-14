import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class TopMonthlyWinners extends StatefulWidget {
  const TopMonthlyWinners({super.key});

  @override
  State<TopMonthlyWinners> createState() => _TopMonthlyWinnersState();
}

class _TopMonthlyWinnersState extends State<TopMonthlyWinners> {
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
                  text: "Top monthly winners of 2025", color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
    ;
  }
}

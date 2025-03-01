import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class TopMonthlyWinners extends StatefulWidget {
  const TopMonthlyWinners({super.key});

  @override
  State<TopMonthlyWinners> createState() => _TopMonthlyWinnersState();
}

class _TopMonthlyWinnersState extends State<TopMonthlyWinners> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
              const BuildSubHeadingText(
                  text: "Top monthly winners", color: Colors.white),
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: height / 1.28,
                  width: width / 1.2,
                  child: ScrollbarTheme(
                    data: ScrollbarThemeData(
                      thumbColor: WidgetStateProperty.all(
                          Colors.white), // White scrollbar
                      // trackColor: MaterialStateProperty.all(
                      //     Colors.grey[800]), // Dark track
                      radius: const Radius.circular(10),
                      thickness: WidgetStateProperty.all(
                          18), // Thickness of scrollbar
                    ),
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      trackVisibility: true,
                      interactive: true, // Enables scrollbar dragging
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 200,
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
                                      const BuildSubHeadingText(
                                        text: "Charlie007",
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      const BuildSubHeadingText(
                                        text: "\$100,000",
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      const BuildSubHeadingText(
                                        text: "won/hour",
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      const BuildSubHeadingText(
                                        text: "\$20",
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

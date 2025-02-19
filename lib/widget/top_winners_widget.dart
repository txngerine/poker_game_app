import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class TopWinnersWidget extends StatefulWidget {
  const TopWinnersWidget({super.key});

  @override
  State<TopWinnersWidget> createState() => _TopWinnersWidgetState();
}

class _TopWinnersWidgetState extends State<TopWinnersWidget> {
  final int totalItems = 73;
  final int itemsPerPage = 20;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Image.network(
      "https://img.freepik.com/premium-vector/playing-cards-dice-casino-logo-vector-illustration_396616-133.jpg",
      fit: BoxFit.cover,
    );
  }

  void _showWinnersDialog(BuildContext context, double width, double height) {
    showDialog(
      context: context,
      builder: (context) {
        int currentPage = 0;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            final leftItems = _generateItems(currentPage, 0);
            final rightItems = _generateItems(currentPage, 10);

            return Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: height / 15),
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
                          text: "Top winners of 2025", color: Colors.white),
                      _buildHeaderButtons(width),
                      _buildHeroFrame(width),
                      _buildWinnersList(width, leftItems, rightItems),
                      _buildPaginationControls(
                          width, currentPage, setDialogState),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<int> _generateItems(int currentPage, int offset) {
    int startIndex = currentPage * itemsPerPage + offset;
    return List.generate(10, (index) {
      int itemIndex = startIndex + index;
      return itemIndex < totalItems ? itemIndex : -1;
    }).where((index) => index != -1).toList();
  }

  Widget _buildHeaderButtons(double width) {
    return Stack(
      children: [
        Image.asset(
            "assets/images/lobby/top winners/Top Winners Header Button BG.png"),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  width: width / 2.2,
                  "assets/images/lobby/top winners/Monthly Winners Button Passive.png",
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  width: width / 2.2,
                  "assets/images/lobby/top winners/Yearly Winners Button Passive.png",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeroFrame(double width) {
    return Stack(
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
            const BuildSubHeadingText(text: "charlie007", fontSize: 10),
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
    );
  }

  Widget _buildWinnersList(
      double width, List<int> leftItems, List<int> rightItems) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final leftIndex =
                index < leftItems.length ? leftItems[index] : null;
            final rightIndex =
                index < rightItems.length ? rightItems[index] : null;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (leftIndex != null) buildPlayerItem(leftIndex, width),
                  if (rightIndex != null) buildPlayerItem(rightIndex, width),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaginationControls(
      double width, int currentPage, StateSetter setDialogState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (currentPage > 0) {
              setDialogState(() => currentPage--);
            }
          },
          child: Image.asset(
            width: width / 10,
            "assets/images/lobby/top winners/previous page (1).png",
          ),
        ),
        BuildSubHeadingText(
          text: "${currentPage + 1}/${(totalItems / itemsPerPage).ceil()}",
          color: Colors.white,
        ),
        GestureDetector(
          onTap: () {
            if ((currentPage + 1) * itemsPerPage < totalItems) {
              setDialogState(() => currentPage++);
            }
          },
          child: Image.asset(
            width: width / 10,
            "assets/images/lobby/top winners/next page (1).png",
          ),
        ),
      ],
    );
  }

  Widget buildPlayerItem(int index, double width) {
    return Expanded(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: BuildSubHeadingText(
              text: "${index + 1}.",
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          Stack(
            children: [
              Image.asset(
                  width: width / 2.8,
                  "assets/images/lobby/top winners/Players Frame.png"),
              Image.asset(
                  width: width / 10,
                  "assets/images/lobby/top winners/Players Avatar BG.png"),
              Padding(
                padding: const EdgeInsets.only(left: 65, top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BuildSubHeadingText(
                          text: "charlie${index + 1}",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        const SizedBox(width: 5),
                        BuildSubHeadingText(
                          text: "\$${(index + 1) * 10000}",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const BuildSubHeadingText(
                            text: "won/hour",
                            color: Colors.white,
                            fontSize: 10),
                        const SizedBox(width: 5),
                        BuildSubHeadingText(
                            text: "\$${(index + 1) * 20}",
                            color: Colors.white,
                            fontSize: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

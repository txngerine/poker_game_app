import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class MonthlyWinnersWidget extends StatefulWidget {
  const MonthlyWinnersWidget({super.key});

  @override
  State<MonthlyWinnersWidget> createState() => _MonthlyWinnersWidgetState();
}

class _MonthlyWinnersWidgetState extends State<MonthlyWinnersWidget> {
  final int totalItems = 73;
  final int itemsPerPage = 20;
  int currentPage = 0;

  List<int> _generateItems(int offset) {
    int startIndex = currentPage * itemsPerPage + offset;
    return List.generate(10, (index) {
      int itemIndex = startIndex + index;
      return itemIndex < totalItems ? itemIndex : -1;
    }).where((index) => index != -1).toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final leftItems = _generateItems(0);
    final rightItems = _generateItems(10);

    return Container(
      height: 200,
      width: width,
      color: Colors.red,
      child: Column(
        children: [
          _buildWinnersList(width, leftItems, rightItems),
          _buildPaginationControls(width, currentPage, (newState) {
            setState(() => currentPage = newState);
          }),
        ],
      ),
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
      double width, int currentPage, Function(int) setNewState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (currentPage > 0) {
              setNewState(currentPage - 1);
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
              setNewState(currentPage + 1);
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
              fontWeight: 13,
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
                          fontWeight: 10,
                        ),
                        const SizedBox(width: 5),
                        BuildSubHeadingText(
                          text: "\$${(index + 1) * 10000}",
                          color: Colors.white,
                          fontWeight: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        BuildSubHeadingText(
                          text: "won/hour",
                          color: Colors.white,
                          fontWeight: 10,
                        ),
                        const SizedBox(width: 5),
                        BuildSubHeadingText(
                          text: "\$${(index + 1) * 20}",
                          color: Colors.white,
                          fontWeight: 10,
                        ),
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

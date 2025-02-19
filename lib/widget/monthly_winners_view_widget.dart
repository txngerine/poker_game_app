import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class MonthlyWinnersViewWidget extends StatefulWidget {
  const MonthlyWinnersViewWidget({super.key});

  @override
  State<MonthlyWinnersViewWidget> createState() =>
      _MonthlyWinnersViewWidgetState();
}

class _MonthlyWinnersViewWidgetState extends State<MonthlyWinnersViewWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 60,
          mainAxisSpacing: 0,
          childAspectRatio: 3.5, // Adjusts item height
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Stack(
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
                          text: "charlie ${index + 1}",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        const SizedBox(width: 5),
                        BuildSubHeadingText(
                          text: "\$${(1) * 10000}",
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
                            text: "\$${(1) * 20}",
                            color: Colors.white,
                            fontSize: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

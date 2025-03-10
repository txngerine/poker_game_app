import 'package:flutter/material.dart';
import 'package:pokerpad/widget/winners_widget.dart';

import 'build_sub_heading_text.dart';

class TopWinnersViewWidget extends StatefulWidget {
  const TopWinnersViewWidget({super.key});

  @override
  State<TopWinnersViewWidget> createState() => _TopWinnersViewWidgetState();
}

class _TopWinnersViewWidgetState extends State<TopWinnersViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.1,
          height: MediaQuery.of(context).size.height / 2.7,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff3C3D37), width: 3),
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const WinnersWidget();
                  },
                );
              },
              child: Image.asset(
                "assets/images/lobby/Poker card.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 74, top: 8),
          child: BuildSubHeadingText(
            text: "Top winners",
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

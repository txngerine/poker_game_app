import 'package:flutter/material.dart';
import 'package:pokerpad/view/lobby_avatar_view.dart';

import 'build_sub_heading_text.dart';

class MonthlyWinnersViewWidget extends StatefulWidget {
  const MonthlyWinnersViewWidget({super.key});

  @override
  State<MonthlyWinnersViewWidget> createState() =>
      _MonthlyWinnersViewWidgetState();
}

class _MonthlyWinnersViewWidgetState extends State<MonthlyWinnersViewWidget> {
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
    return SizedBox(
      height: height / 1.28,
      width: width / 1.2,
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(Colors.grey),
          radius: Radius.circular(10),
          thickness: WidgetStatePropertyAll(17),
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          interactive: true,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: 70,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                        "assets/images/lobby/top winners/villain rank holder.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return LobbyAvatarView();
                                    },
                                  );
                                },
                                child: Image.asset(
                                  "assets/images/lobby/top winners/villain avatar holder.png",
                                  width: width / 9,
                                ),
                              ),
                            ),
                            const BuildSubHeadingText(
                              text: "Charlie007",
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        BuildSubHeadingText(
                          text: "${index + 1}",
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const BuildSubHeadingText(
                          text: "\$20",
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        BuildSubHeadingText(
                          text: "\$100,${index + 159}",
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

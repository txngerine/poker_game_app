import 'package:flutter/material.dart';

import 'affiliate_balance_section.dart';
import 'affiliate_players_section.dart';
import 'build_text_widget.dart';

class AffiliateViewWidget extends StatefulWidget {
  const AffiliateViewWidget({super.key});

  @override
  State<AffiliateViewWidget> createState() => _AffiliateViewWidgetState();
}

class _AffiliateViewWidgetState extends State<AffiliateViewWidget> {
  // int currentPage = 1;
  // final int itemsPerPage = 8;
  // final int totalItems = 47;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        const Row(
          children: [AffiliateBalanceSection(), AffiliatePlayersSection()],
        ),
        Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/Affiliate/total rake text holder.png",
                  width: width / 2,
                ),
                Positioned(
                  top: 12,
                  left: width / 2.7,
                  child: const Text(
                    "\$50,000",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/images/Affiliate/total commission holder.png",
                  width: width / 2,
                ),
                Positioned(
                  top: 12,
                  left: width / 2.7,
                  child: const Text(
                    "\$36,214",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
        //
        Stack(
          children: [
            Image.asset(
              "assets/images/Affiliate/1st layer box.png",
              width: width,
              height: height / 1.32,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/images/Affiliate/Affiliate bar.png"),
                      const Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            BuildTextWidget(
                              text: "SEARCH",
                              fontSize: 10,
                            ),
                            SizedBox(
                              width: 48,
                            ),
                            BuildTextWidget(
                              text: "TRANSFER",
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            BuildTextWidget(
                              text: " PLAYER'S \n BALANCE",
                              fontSize: 10,
                            ),
                            BuildTextWidget(
                              text: "   WINNING \n AFTER RAKE",
                              fontSize: 10,
                            ),
                            BuildTextWidget(
                              text: " RAKE \n PAID",
                              fontSize: 10,
                            ),
                            BuildTextWidget(
                              text: "   AFFILIATE \n COMMISSION",
                              fontSize: 10,
                            ),
                            SizedBox(
                              width: 1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    // color: Colors.red,
                    height: height / 1.515,
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        // int actualIndex =
                        //     (currentPage - 1) * itemsPerPage + index;
                        // if (actualIndex >= totalItems) return const SizedBox();
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
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(
                                          "assets/images/Affiliate/winning player.png",
                                          width: width / 10,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "ID:#${index + 1}",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Text(
                                            "CHARLIE007",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        "assets/images/Affiliate/SEND BUTTON ALERT.png",
                                        width: width / 8,
                                      ),
                                      const Text(
                                        "\$432,678",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Text(
                                        "\$43,632",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Text(
                                        "\$50,000",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Text(
                                        "\$500",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
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
                  const SizedBox(
                    height: 25,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         if (currentPage > 1) {
                  //           setState(() {
                  //             currentPage--;
                  //           });
                  //         }
                  //       },
                  //       child: Image.asset(
                  //           "assets/images/Affiliate/previous page.png",
                  //           width: width / 10),
                  //     ),
                  //     Text("$currentPage/${(totalItems / itemsPerPage).ceil()}",
                  //         style: const TextStyle(color: Colors.white)),
                  //     GestureDetector(
                  //       onTap: () {
                  //         if (currentPage <
                  //             (totalItems / itemsPerPage).ceil()) {
                  //           setState(() {
                  //             currentPage++;
                  //           });
                  //         }
                  //       },
                  //       child: Image.asset(
                  //           "assets/images/Affiliate/next page.png",
                  //           width: width / 10),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

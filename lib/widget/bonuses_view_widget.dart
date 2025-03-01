import 'package:flutter/material.dart';
import 'package:pokerpad/widget/bonuses_2k_button_widget.dart';

import 'affiliate_balance_section.dart';
import 'build_text_widget.dart';

class BonusesViewWidget extends StatefulWidget {
  const BonusesViewWidget({super.key});

  @override
  State<BonusesViewWidget> createState() => _BonusesViewWidgetState();
}

class _BonusesViewWidgetState extends State<BonusesViewWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Row(
          children: [
            const AffiliateBalanceSection(),
            Image.asset(
                width: width / 2,
                "assets/images/Affiliate/bonus/refer a friend.png")
          ],
        ),
        Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/Affiliate/bonus/bonuses pending.png",
                  width: width / 2,
                ),
                Positioned(
                  top: 12,
                  left: width / 2.7,
                  child: const Text(
                    "\$34,000",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/images/Affiliate/bonus/bonuses claimed.png",
                  width: width / 2,
                ),
                Positioned(
                  top: 12,
                  left: width / 2.7,
                  child: const Text(
                    "\$16,000",
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
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 1,
                            ),
                            const BuildTextWidget(
                              text: "SEARCH",
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            const BuildTextWidget(
                              text: "REFERRALS",
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const BuildTextWidget(
                              text: "ROAD TO \$ 10,000",
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                const BuildTextWidget(
                                  text: "BONUSES CLAIMED",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                ),
                                Image.asset(
                                    height: height / 49,
                                    "assets/images/Affiliate/bonus/triangle.png"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height / 1.495,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        // int actualIndex =
                        //     (currentPage - 1) * itemsPerPage + index;
                        // if (actualIndex >= totalItems) return const SizedBox();
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/Affiliate/bonus/bonus bg frame.png",
                                  width: width / 1,
                                  height: height / 7,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width / 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 3),
                                        child: Image.asset(
                                          "assets/images/Affiliate/bonus/winning player frame.png",
                                          width: width / 5.5,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
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
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                            "Rake:\$37k/\$100k",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: width / 2,
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Bonuses2kButtonWidget(),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Bonuses2kButtonWidget(),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Bonuses2kButtonWidget(),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Bonuses2kButtonWidget(),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Bonuses2kButtonWidget(),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: 8,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[600],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    ),
                                                    FractionallySizedBox(
                                                      widthFactor: 0.5,
                                                      child: Container(
                                                        height: 8,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffFFC94A),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      '${(0.5 * 100).toStringAsFixed(0)}%',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.white70)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "\$5,000",
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
                  // const SizedBox(
                  //   height: 25,
                  // ),
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

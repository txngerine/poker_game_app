import 'package:flutter/material.dart';

import 'bonuses_2k_button_widget.dart';

class AffiliateBonusesListview extends StatefulWidget {
  const AffiliateBonusesListview({super.key});

  @override
  State<AffiliateBonusesListview> createState() =>
      _AffiliateBonusesListviewState();
}

class _AffiliateBonusesListviewState extends State<AffiliateBonusesListview> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          // color: Colors.grey,
        ),
        height: height / 1.750,
        width: width,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
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
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[600],
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        FractionallySizedBox(
                                          widthFactor: 0.5,
                                          child: Container(
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFFC94A),
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${(0.5 * 100).toStringAsFixed(0)}%',
                                          style: const TextStyle(
                                              color: Colors.white70)),
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
    );
  }
}

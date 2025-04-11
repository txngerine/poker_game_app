import 'package:flutter/material.dart';
import 'bonuses_2k_button_widget.dart';
import 'chart_line_widget.dart';

class AffiliateBonusesListview extends StatefulWidget {
  final String searchQuery;

  const AffiliateBonusesListview({super.key, required this.searchQuery});

  @override
  State<AffiliateBonusesListview> createState() =>
      _AffiliateBonusesListviewState();
}

class _AffiliateBonusesListviewState extends State<AffiliateBonusesListview> {
  final List<Map<String, dynamic>> bonuses = List.generate(10, (index) {
    return {
      "id": "#${index + 1}",
      "username": "CHARLIE00${index + 1}",
      "rake": "\$37k/\$100k",
      "bonus": "\$5,000",
      "progress": 0.5, // Sample progress
    };
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // Filter the list based on search query
    final filteredBonuses = bonuses.where((bonus) {
      final query = widget.searchQuery.toLowerCase();
      return bonus["username"].toLowerCase().contains(query) ||
          bonus["id"].toLowerCase().contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        height: height / 1.750,
        width: width,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: filteredBonuses.length,
          itemBuilder: (context, index) {
            final bonus = filteredBonuses[index];
            return Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/Affiliate/bonus/bonus bg frame.png",
                      width: width,
                      height: height / 7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width / 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: GestureDetector(
                              onTap: () {
                                // Handle tap event
                                showDialog(
                      context: context,
                      builder: (context) {
                      return ChartLineWidget(
                        );
                      },
                    );
                              },
                              child: Image.asset(
                                "assets/images/Affiliate/bonus/winning player frame.png",
                                width: width / 5.5,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "ID:${bonus["id"]}",
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                bonus["username"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                bonus["rake"],
                                style: const TextStyle(
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
                                  const SizedBox(height: 20),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Bonuses2kButtonWidget(),
                                      SizedBox(width: 8),
                                      Bonuses2kButtonWidget(),
                                      SizedBox(width: 8),
                                      Bonuses2kButtonWidget(),
                                      SizedBox(width: 8),
                                      Bonuses2kButtonWidget(),
                                      SizedBox(width: 8),
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
                                          widthFactor: bonus["progress"],
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
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          '${(bonus["progress"] * 100).toStringAsFixed(0)}%',
                                          style: const TextStyle(
                                              color: Colors.white70)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            bonus["bonus"],
                            style: const TextStyle(
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

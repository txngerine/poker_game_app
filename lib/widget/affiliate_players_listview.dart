// import 'package:flutter/material.dart';

// import 'build_sub_heading_text.dart';

// class AffiliatePlayersListview extends StatefulWidget {
//   const AffiliatePlayersListview({super.key});

//   @override
//   State<AffiliatePlayersListview> createState() =>
//       _AffiliatePlayersListviewState();
// }

// class _AffiliatePlayersListviewState extends State<AffiliatePlayersListview> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           // color: Colors.grey,
//         ),
//         height: height / 1.560,
//         width: width,
//         child: ListView.builder(
//           itemCount: 20,
//           itemBuilder: (context, index) {
//             // int actualIndex =
//             //     (currentPage - 1) * itemsPerPage + index;
//             // if (actualIndex >= totalItems) return const SizedBox();
//             return Column(
//               children: [
//                 ClipRRect(
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: Container(
//                         width: width,
//                         height: height / 16,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 "assets/images/affiliate screen/player frame.png"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(1.0),
//                                   child: Image.asset(
//                                     "assets/images/affiliate screen/losing player (1).png",
//                                     width: width / 10,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 13),
//                                   child: Column(
//                                     children: [
//                                       BuildSubHeadingText(
//                                         text: "ID:#${index + 100}",
//                                         color: Colors.white,
//                                         fontSize: 10,
//                                       ),
//                                       const BuildSubHeadingText(
//                                         text: "CHARLIE007",
//                                         color: Colors.white,
//                                         fontSize: 12,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Image.asset(
//                                 "assets/images/affiliate screen/aff_transfer button.png"),
//                             const BuildSubHeadingText(
//                               text: "\$432,732",
//                               color: Colors.white70,
//                               fontSize: 9,
//                             ),
//                             const BuildSubHeadingText(
//                               text: "\$612,432",
//                               color: Colors.green,
//                               fontSize: 9,
//                             ),
//                             const BuildSubHeadingText(
//                               text: "\$50,000",
//                               color: Colors.white70,
//                               fontSize: 9,
//                             ),
//                             const BuildSubHeadingText(
//                               text: "\$500",
//                               color: Colors.white70,
//                               fontSize: 9,
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'build_sub_heading_text.dart';

class AffiliatePlayersListview extends StatefulWidget {
  final String searchQuery;

  const AffiliatePlayersListview({super.key, required this.searchQuery});

  @override
  State<AffiliatePlayersListview> createState() =>
      _AffiliatePlayersListviewState();
}

class _AffiliatePlayersListviewState extends State<AffiliatePlayersListview> {
  final List<Map<String, dynamic>> players = List.generate(
    20,
    (index) => {
      "id": index + 100,
      "username": "CHARLIE${index + 1}",
      "transfer": "\$432,732",
      "balance": "\$612,432",
      "winnings": "\$50,000",
      "rake": "\$500",
    },
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // Filter players based on search query
    final filteredPlayers = players
        .where((player) => player["username"]
            .toLowerCase()
            .contains(widget.searchQuery.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        height: height / 1.560,
        width: width,
        child: filteredPlayers.isEmpty
            ? const Center(
                child: BuildSubHeadingText(
                  text: "No players found",
                  color: Colors.white70,
                  fontSize: 12,
                ),
              )
            : ListView.builder(
                itemCount: filteredPlayers.length,
                itemBuilder: (context, index) {
                  final player = filteredPlayers[index];

                  return Column(
                    children: [
                      ClipRRect(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: width,
                            height: height / 16,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/affiliate screen/player frame.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                        "assets/images/affiliate screen/losing player (1).png",
                                        width: width / 10,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 13),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BuildSubHeadingText(
                                            text: "ID:#${player['id']}",
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                          BuildSubHeadingText(
                                            text: player['username'],
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/affiliate screen/aff_transfer button.png",
                                  width: 40,
                                ),
                                BuildSubHeadingText(
                                  text: player['transfer'],
                                  color: Colors.white70,
                                  fontSize: 9,
                                ),
                                BuildSubHeadingText(
                                  text: player['balance'],
                                  color: Colors.green,
                                  fontSize: 9,
                                ),
                                BuildSubHeadingText(
                                  text: player['winnings'],
                                  color: Colors.white70,
                                  fontSize: 9,
                                ),
                                BuildSubHeadingText(
                                  text: player['rake'],
                                  color: Colors.white70,
                                  fontSize: 9,
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

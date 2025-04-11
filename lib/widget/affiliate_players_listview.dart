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



// import 'package:flutter/material.dart';
// import 'build_sub_heading_text.dart';

// class AffiliatePlayersListview extends StatefulWidget {
//   final String searchQuery;

//   const AffiliatePlayersListview({super.key, required this.searchQuery});

//   @override
//   State<AffiliatePlayersListview> createState() =>
//       _AffiliatePlayersListviewState();
// }

// class _AffiliatePlayersListviewState extends State<AffiliatePlayersListview> {
//   final List<Map<String, dynamic>> players = List.generate(
//     20,
//     (index) => {
//       "id": index + 100,
//       "username": "CHARLIE${index + 1}",
//       "transfer": "\$432,732",
//       "balance": "\$612,432",
//       "winnings": "\$50,000",
//       "rake": "\$500",
//     },
//   );

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;

//     // Filter players based on search query
//     final filteredPlayers = players
//         .where((player) => player["username"]
//             .toLowerCase()
//             .contains(widget.searchQuery.toLowerCase()))
//         .toList();

//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//         ),
//         height: height / 1.560,
//         width: width,
//         child: filteredPlayers.isEmpty
//             ? const Center(
//                 child: BuildSubHeadingText(
//                   text: "No players found",
//                   color: Colors.white70,
//                   fontSize: 12,
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: filteredPlayers.length,
//                 itemBuilder: (context, index) {
//                   final player = filteredPlayers[index];

//                   return Column(
//                     children: [
//                       ClipRRect(
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: Container(
//                             width: width,
//                             height: height / 16,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     "assets/images/affiliate screen/player frame.png"),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Image.asset(
//                                         "assets/images/affiliate screen/losing player (1).png",
//                                         width: width / 10,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 13),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           BuildSubHeadingText(
//                                             text: "ID:#${player['id']}",
//                                             color: Colors.white,
//                                             fontSize: 10,
//                                           ),
//                                           BuildSubHeadingText(
//                                             text: player['username'],
//                                             color: Colors.white,
//                                             fontSize: 12,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Image.asset(
//                                   "assets/images/affiliate screen/aff_transfer button.png",
//                                   width: 40,
//                                 ),
//                                 BuildSubHeadingText(
//                                   text: player['transfer'],
//                                   color: Colors.white70,
//                                   fontSize: 9,
//                                 ),
//                                 BuildSubHeadingText(
//                                   text: player['balance'],
//                                   color: Colors.green,
//                                   fontSize: 9,
//                                 ),
//                                 BuildSubHeadingText(
//                                   text: player['winnings'],
//                                   color: Colors.white70,
//                                   fontSize: 9,
//                                 ),
//                                 BuildSubHeadingText(
//                                   text: player['rake'],
//                                   color: Colors.white70,
//                                   fontSize: 9,
//                                 ),
//                                 const SizedBox(width: 15),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }


// // ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'build_sub_heading_text.dart';
// import 'transfer_button_widget.dart';

// class AffiliatePlayersListview extends StatefulWidget {
//   final String searchQuery;
//   final String? sortField;
//   final bool isAscending;

//   const AffiliatePlayersListview({
//     super.key,
//     required this.searchQuery,
//     this.sortField,
//     this.isAscending = true,
//   });

//   @override
//   State<AffiliatePlayersListview> createState() =>
//       _AffiliatePlayersListviewState();
// }

// class _AffiliatePlayersListviewState extends State<AffiliatePlayersListview> {
//   final List<Map<String, dynamic>> players = List.generate(
//     20,
//     (index) => {
//       "id": index + 100,
//       "username": "CHARLIE${index + 1}",
//       "balance": "\$432,732",
//       "winnings": 612432,
//       "rake": 50000,
//       "commission": 500,
//     },
//   );

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;

//     // Filter players based on search query
//     List<Map<String, dynamic>> filteredPlayers = players
//         .where((player) => player["username"]
//             .toLowerCase()
//             .contains(widget.searchQuery.toLowerCase()))
//         .toList();

//     // Sort based on selected field
//     if (widget.sortField != null) {
//       filteredPlayers.sort((a, b) {
//         if (a[widget.sortField] is int) {
//           return widget.isAscending
//               ? a[widget.sortField].compareTo(b[widget.sortField])
//               : b[widget.sortField].compareTo(a[widget.sortField]);
//         }
//         return 0; // Skip sorting if not a sortable field
//       });
//     }

//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//         ),
//         height: height / 1.560,
//         width: width,
//         child: filteredPlayers.isEmpty
//             ? const Center(
//                 child: BuildSubHeadingText(
//                   text: "No players found",
//                   color: Colors.white70,
//                   fontSize: 12,
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: filteredPlayers.length,
//                 itemBuilder: (context, index) {
//                   final player = filteredPlayers[index];

//                   return Column(
//                     children: [
//                       ClipRRect(
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: Container(
//                             width: width,
//                             height: height / 16,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     "assets/images/affiliate screen/player frame.png"),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Image.asset(
//                                         "assets/images/affiliate screen/losing player (1).png",
//                                         width: width / 10,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 13),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           BuildSubHeadingText(
//                                             text: "ID:#${player['id']}",
//                                             color: Colors.white,
//                                             fontSize: 10,
//                                           ),
//                                           BuildSubHeadingText(
//                                             text: player['username'],
//                                             color: Colors.white,
//                                             fontSize: 12,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     print("Transfer button clicked for ${player['username']}");
//                                   },
//                                   child: Image.asset(
//                                     "assets/images/affiliate screen/aff_transfer button.png",
//                                     width: 40,
//                                   ),
//                                 ),
//                                 _buildPlayerStat(player['balance'], Colors.white70, 9),
//                                 _buildPlayerStat(
//                                     "\$${player['winnings'].toString()}",
//                                     Colors.green,
//                                     9),
//                                 _buildPlayerStat(
//                                     "\$${player['rake'].toString()}",
//                                     Colors.white70,
//                                     9),
//                                 _buildPlayerStat(
//                                     "\$${player['commission'].toString()}",
//                                     Colors.white70,
//                                     9),
//                                 const SizedBox(width: 15),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//       ),
//     );
//   }

//   Widget _buildPlayerStat(String text, Color color, double fontSize) {
//     return BuildSubHeadingText(
//       text: text,
//       color: color,
//       fontSize: fontSize,
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../model/affiliate_model_response.dart';
// import 'build_sub_heading_text.dart';
// import 'transfer_button_widget.dart';

// class AffiliatePlayersListview extends StatefulWidget {
//   final String searchQuery;
//   final String? sortField;
//   final bool isAscending;

//   const AffiliatePlayersListview({
//     super.key,
//     required this.searchQuery,
//     this.sortField,
//     this.isAscending = true,
//   });

//   @override
//   State<AffiliatePlayersListview> createState() =>
//       _AffiliatePlayersListviewState();
// }

// class _AffiliatePlayersListviewState extends State<AffiliatePlayersListview> {
//   late Future<List<Player>> _futurePlayers;

//   @override
//   void initState() {
//     super.initState();
//     _futurePlayers = _fetchAffiliatePlayers();
//   }

//   Future<List<Player>> _fetchAffiliatePlayers() async {
//     final response = await http.get(
//       Uri.parse('http://3.6.170.253:1080/server.php/api/v1/affiliate-player-summary/1'),
//     );

//     if (response.statusCode == 200) {
//       final affiliateData = affiliateModelResponseFromJson(response.body);
//       return affiliateData.data?.players ?? [];
//     } else {
//       throw Exception('Failed to load players');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: FutureBuilder<List<Player>>(
//         future: _futurePlayers,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           List<Player> players = snapshot.data!
//               .where((player) => player.nickname!
//                   .toLowerCase()
//                   .contains(widget.searchQuery.toLowerCase()))
//               .toList();

//           if (widget.sortField != null) {
//             players.sort((a, b) {
//               final aVal = _getFieldValue(a, widget.sortField!);
//               final bVal = _getFieldValue(b, widget.sortField!);
//               if (aVal is Comparable && bVal is Comparable) {
//                 return widget.isAscending
//                     ? aVal.compareTo(bVal)
//                     : bVal.compareTo(aVal);
//               }
//               return 0;
//             });
//           }

//           if (players.isEmpty) {
//             return const Center(
//               child: BuildSubHeadingText(
//                 text: "No players found",
//                 color: Colors.white70,
//                 fontSize: 12,
//               ),
//             );
//           }

//           return SizedBox(
//             height: height / 1.56,
//             child: ListView.builder(
//               itemCount: players.length,
//               itemBuilder: (context, index) {
//                 final player = players[index];

//                 return Column(
//                   children: [
//                     ClipRRect(
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Container(
//                           width: width,
//                           height: height / 16,
//                           decoration: const BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/images/affiliate screen/player frame.png"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(1.0),
//                                     child: Image.asset(
//                                       "assets/images/affiliate screen/losing player (1).png",
//                                       width: width / 10,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 13),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         BuildSubHeadingText(
//                                           text: "ID:#${player.id}",
//                                           color: Colors.white,
//                                           fontSize: 10,
//                                         ),
//                                         BuildSubHeadingText(
//                                           text: player.nickname ?? '',
//                                           color: Colors.white,
//                                           fontSize: 12,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   print("Transfer button clicked for ${player.nickname}");
//                                 },
//                                 child: Image.asset(
//                                   "assets/images/affiliate screen/aff_transfer button.png",
//                                   width: 40,
//                                 ),
//                               ),
//                               _buildPlayerStat("\$${player.balance?.toStringAsFixed(2) ?? '0.00'}", Colors.white70, 9),
//                               _buildPlayerStat(
//                                 "\$${player.profit?.toStringAsFixed(2) ?? '0.00'}",
//                                 (player.profit ?? 0) < 0 ? Colors.red : Colors.green,
//                                 9,
//                               ),
//                               _buildPlayerStat("\$0", Colors.white70, 9), // Placeholder rake
//                               _buildPlayerStat("\$${player.commission?.toStringAsFixed(2) ?? '0.00'}", Colors.white70, 9),
//                               const SizedBox(width: 15),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildPlayerStat(String text, Color color, double fontSize) {
//     return BuildSubHeadingText(
//       text: text,
//       color: color,
//       fontSize: fontSize,
//     );
//   }

//   dynamic _getFieldValue(Player player, String field) {
//     switch (field) {
//       case 'nickname':
//         return player.nickname?.toLowerCase() ?? '';
//       case 'balance':
//         return player.balance ?? 0.0;
//       case 'commission':
//         return player.commission ?? 0.0;
//       case 'profit':
//         return player.profit ?? 0.0;
//       default:
//         return '';
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/affiliate_player_model_resp.dart';
import 'build_sub_heading_text.dart';

class AffiliatePlayersListviews extends StatefulWidget {
  final String searchQuery;
  final String? sortField;
  final bool isAscending;

  const AffiliatePlayersListviews({
    super.key,
    required this.searchQuery,
    this.sortField,
    this.isAscending = true,
  });

  @override
  State<AffiliatePlayersListviews> createState() =>
      _AffiliatePlayersListviewsState();
}

class _AffiliatePlayersListviewsState extends State<AffiliatePlayersListviews> {
  late Future<List<Datum>> _futurePlayers;

  @override
  void initState() {
    super.initState();
    _futurePlayers = fetchAffiliatePlayers();
  }

  Future<List<Datum>> fetchAffiliatePlayers() async {
    final response = await http.get(
      Uri.parse(
          'http://3.6.170.253:1080/server.php/api/v1/affiliate-players/1'),
    );

    if (response.statusCode == 200) {
      final data = affiliatePlayerModelRespFromJson(response.body);
      return data.data ?? [];
    } else {
      throw Exception('Failed to fetch players');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return FutureBuilder<List<Datum>>(
      future: _futurePlayers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<Datum> players = snapshot.data ?? [];

        List<Datum> filteredPlayers = players
            .where((p) => (p.playerNickname ?? "")
                .toLowerCase()
                .contains(widget.searchQuery.toLowerCase()))
            .toList();

        if (widget.sortField != null) {
          filteredPlayers.sort((a, b) {
            final aVal = _getSortValue(a, widget.sortField!);
            final bVal = _getSortValue(b, widget.sortField!);
            if (aVal is Comparable && bVal is Comparable) {
              return widget.isAscending
                  ? aVal.compareTo(bVal)
                  : bVal.compareTo(aVal);
            }
            return 0;
          });
        } else {
          filteredPlayers.sort((a, b) {
            final aId = a.playerId ?? 0;
            final bId = b.playerId ?? 0;
            return aId.compareTo(bId);
          });
        }

        if (filteredPlayers.isEmpty) {
          return const Center(
            child: BuildSubHeadingText(
              text: "No players found",
              color: Colors.white70,
              fontSize: 12,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            height: height / 1.678,
            width: width,
            child: ListView.builder(
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
                                          text: "ID:#${player.playerId}",
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                        BuildSubHeadingText(
                                          text: player.playerNickname ?? '',
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(
                                      "Transfer button clicked for ${player.playerNickname}");
                                },
                                child: Image.asset(
                                  "assets/images/affiliate screen/aff_transfer button.png",
                                  width: 40,
                                ),
                              ),
                              _buildPlayerStat(
                                  player.balance ?? "-", Colors.white70, 9),
                              _buildPlayerStat(
                                  "\$${player.totalWon ?? '0'}", Colors.green, 9),
                              _buildPlayerStat(
                                  "\$${player.totalRake ?? '0'}", Colors.white70, 9),
                              _buildPlayerStat(
                                  "\$${player.commission ?? '0'}", Colors.white70, 9),
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
      },
    );
  }

  dynamic _getSortValue(Datum player, String field) {
    String cleanNumeric(String? value) {
      return value?.replaceAll(RegExp(r'[^\d.-]'), '') ?? '0';
    }

    switch (field) {
      case 'playerNickname':
        return player.playerNickname?.toLowerCase() ?? '';
      case 'totalWon':
        return double.tryParse(cleanNumeric(player.totalWon)) ?? 0.0;
      case 'totalRake':
        return double.tryParse(cleanNumeric(player.totalRake)) ?? 0.0;
      case 'commission':
        return double.tryParse(cleanNumeric(player.commission)) ?? 0.0;
      case 'balance':
        return double.tryParse(cleanNumeric(player.balance)) ?? 0.0;
      default:
        return 0;
    }
  }

  Widget _buildPlayerStat(String text, Color color, double fontSize) {
    return BuildSubHeadingText(
      text: text,
      color: color,
      fontSize: fontSize,
    );
  }
}

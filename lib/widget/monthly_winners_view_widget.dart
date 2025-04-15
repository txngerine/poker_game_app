// import 'package:flutter/material.dart';

// import '../model/leaderboard_monthly_model.dart';
// import '../services/api_service.dart';
// import 'build_sub_heading_text.dart';
// import 'chart_line_widget.dart';

// class MonthlyWinnersViewWidget extends StatefulWidget {
//   const MonthlyWinnersViewWidget({super.key});

//   @override
//   State<MonthlyWinnersViewWidget> createState() =>
//       _MonthlyWinnersViewWidgetState();
// }

// class _MonthlyWinnersViewWidgetState extends State<MonthlyWinnersViewWidget> {
//   final ScrollController _scrollController = ScrollController();
//   final ApiService _apiService = ApiService();
//   List<Player> _players = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchLeaderboard();
//   }

//   Future<void> _fetchLeaderboard() async {
//     try {
//       LeaderboardMonthly? leaderboard = await _apiService.fetchLeaderboard();
//       if (leaderboard != null && leaderboard.data != null) {
//         setState(() {
//           _players = leaderboard.data?.report ?? [];
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Error loading leaderboard: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;

//     return SizedBox(
//       height: height / 1.28,
//       width: width / 1.2,
//       child: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _players.isEmpty
//               ? const Center(
//                   child: BuildSubHeadingText(
//                     text: "No data available",
//                     color: Colors.black,
//                     fontSize: 14,
//                   ),
//                 )
//               : ScrollbarTheme(
//                   data: ScrollbarThemeData(
//                     thumbColor: MaterialStateProperty.all(Colors.grey),
//                     radius: const Radius.circular(10),
//                     thickness: MaterialStateProperty.all(17),
//                   ),
//                   child: Scrollbar(
//                     controller: _scrollController,
//                     thumbVisibility: true,
//                     trackVisibility: true,
//                     interactive: true,
//                     child: Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: ListView.builder(
//                         controller: _scrollController,
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: _players.length,
//                         itemBuilder: (context, index) {
//                           Player player = _players[index];
//                           return Stack(
//                             children: [
//                               Image.asset(
//                                 "assets/images/lobby/top winners/villain rank holder.png",
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 8.0, horizontal: 12.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (context) {
//                                                 return const ChartLineWidget();
//                                               },
//                                             );
//                                           },
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(1.0),
//                                             child: CircleAvatar(
//   radius: 23.5,
//   backgroundColor: Colors.grey[300],
//   backgroundImage: player.photo != null && player.photo!.isNotEmpty
//       ? NetworkImage(player.photo!)
//       : const AssetImage("assets/images/lobby/top winners/villain avatar holder.png") as ImageProvider,
//   onBackgroundImageError: (_, __) {
//     // Handle image error if needed
//   },
// ),

//                                           ),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         BuildSubHeadingText(
//                                           text: player.nickname ?? "Unknown",
//                                           color: Colors.black,
//                                           fontSize: 12,
//                                         ),
//                                       ],
//                                     ),
//                                     BuildSubHeadingText(
//                                       text: "${player.rank ?? index + 1}",
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                     ),
//                                     const SizedBox(width: 10),
//                                     BuildSubHeadingText(
//                                       text: "\$${player.hourlyWin ?? 0}",
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                     ),
//                                     const SizedBox(width: 10),
//                                     BuildSubHeadingText(
//                                       text: "\$${player.totalWin ?? 0}",
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../model/leaderboard_monthly_model.dart';
import '../services/api_service.dart';
import 'build_sub_heading_text.dart';
import 'chart_line_widget.dart';

class MonthlyWinnersViewWidget extends StatefulWidget {
  final String id; // Accept the ID here

  const MonthlyWinnersViewWidget({super.key, required this.id}); // Pass the id to the constructor

  @override
  State<MonthlyWinnersViewWidget> createState() =>
      _MonthlyWinnersViewWidgetState();
}

class _MonthlyWinnersViewWidgetState extends State<MonthlyWinnersViewWidget> {
  final ScrollController _scrollController = ScrollController();
  final ApiService _apiService = ApiService();
  List<Report> _reports = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLeaderboard();
  }

  Future<void> _fetchLeaderboard() async {
    try {
      // Use widget.id to fetch leaderboard data
      LeaderboardMonthly? leaderboard = await _apiService.fetchLeaderboard(widget.id);
      if (leaderboard != null && leaderboard.data != null) {
        setState(() {
          _reports = leaderboard.data?.report ?? [];
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading leaderboard: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

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
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _reports.isEmpty
              ? const Center(
                  child: BuildSubHeadingText(
                    text: "No data available",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              : ScrollbarTheme(
                  data: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(Colors.grey),
                    radius: const Radius.circular(10),
                    thickness: MaterialStateProperty.all(17),
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
                        itemCount: _reports.length,
                        itemBuilder: (context, index) {
                          Report report = _reports[index];
                          return Stack(
                            children: [
                              Image.asset(
                                "assets/images/lobby/top winners/villain rank holder.png",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const ChartLineWidget();
                                              },
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: CircleAvatar(
                                              radius: 23.5,
                                              backgroundColor: Colors.grey[300],
                                              backgroundImage: report.photo != null &&
                                                      report.photo!.isNotEmpty
                                                  ? NetworkImage(report.photo!)
                                                  : const AssetImage(
                                                          "assets/images/lobby/top winners/villain avatar holder.png")
                                                      as ImageProvider,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        BuildSubHeadingText(
                                          text: report.nickname ?? "Unknown",
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                    BuildSubHeadingText(
                                      text: "${report.rank ?? index + 1}",
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    const SizedBox(width: 10),
                                    BuildSubHeadingText(
                                      text: "\$${report.hourlyWin ?? "0"}",
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    const SizedBox(width: 10),
                                    BuildSubHeadingText(
                                      text: "\$${report.totalWin ?? "0"}",
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
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

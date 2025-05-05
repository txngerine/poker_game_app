// import 'package:flutter/material.dart';
// import 'package:pokerpad/widget/monthly_winners_view_widget.dart';
// import 'package:pokerpad/widget/yearly_winners_view.dart';

// import 'build_sub_heading_text.dart';
// import 'chart_line_widget.dart';

// class WinnersWidget extends StatefulWidget {
//   const WinnersWidget({super.key});

//   @override
//   State<WinnersWidget> createState() => _WinnersWidgetState();
// }

// class _WinnersWidgetState extends State<WinnersWidget> {
//   int selectButton = 1;
//   void updateContent(int buttonNumber) {
//     setState(() {
//       selectButton = buttonNumber;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     return Padding(
//       padding:
//           EdgeInsets.only(left: 20, right: 20, bottom: 10, top: height / 15),
//       child: Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: EdgeInsets.zero,
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),
//                 selectButton == 1
//                     ? const BuildSubHeadingText(
//                         text: "Top February winners", color: Colors.white)
//                     : const BuildSubHeadingText(
//                         text: "Top winners of 2025", color: Colors.white),
//                 const SizedBox(height: 20),
//                 Stack(
//                   children: [
//                     Image.asset(
//                         "assets/images/lobby/top winners/Top Winners Header Button BG.png"),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               updateContent(1);
//                             },
//                             child: selectButton == 1
//                                 ? Image.asset(
//                                     width: width / 2.2,
//                                     "assets/images/lobby/top winners/Monthly Winners Button Active.png",
//                                   )
//                                 : Image.asset(
//                                     width: width / 2.2,
//                                     "assets/images/lobby/top winners/Monthly Winners Button Passive.png",
//                                   ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               updateContent(2);
//                             },
//                             child: selectButton == 2
//                                 ? Image.asset(
//                                     width: width / 2.2,
//                                     "assets/images/lobby/top winners/Yearly Winners Button Active.png",
//                                   )
//                                 : Image.asset(
//                                     width: width / 2.2,
//                                     "assets/images/lobby/top winners/Yearly Winners Button Passive.png",
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     BuildSubHeadingText(
//                       text: "  Players",
//                       fontSize: 10,
//                       color: Colors.white,
//                     ),
//                     BuildSubHeadingText(
//                       text: "  Rank",
//                       fontSize: 10,
//                       color: Colors.white,
//                     ),
//                     BuildSubHeadingText(
//                       text: "  Won/Hour",
//                       fontSize: 10,
//                       color: Colors.white,
//                     ),
//                     BuildSubHeadingText(
//                       text: "  Winnings",
//                       fontSize: 10,
//                       color: Colors.white,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                   ],
//                 ),
//                 Stack(
//                   children: [
//                     Image.asset(
//                         "assets/images/lobby/top winners/hero rank holder.png"),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return const ChartLineWidget();
//                                     },
//                                   );
//                                 },
//                                 child: Image.asset(
//                                   width: width / 9,
//                                   "assets/images/lobby/top winners/hero avatar holder.png",
//                                 ),
//                               ),
//                             ),
//                             const BuildSubHeadingText(
//                               text: "charlie007",
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                         const BuildSubHeadingText(
//                           text: "17",
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         const BuildSubHeadingText(
//                           text: "\$20",
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         const BuildSubHeadingText(
//                           text: "\$100,000",
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Container(
//                       width: width,
//                       height: height / 1.424,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: selectButton == 1
//                           ? const MonthlyWinnersViewWidget()
//                           : const YearlyWinnersView()),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:pokerpad/widget/monthly_winners_view_widget.dart';
// import 'package:pokerpad/widget/yearly_winners_view.dart';
// import '../model/leaderboard_yearly_model.dart';
// import '../services/api_service.dart';
// import 'build_sub_heading_text.dart';
// import 'chart_line_widget.dart';
// import '../model/leaderboard_monthly_model.dart';

// class WinnersWidget extends StatefulWidget {
//   const WinnersWidget({super.key, int? id});

//   @override
//   State<WinnersWidget> createState() => _WinnersWidgetState();
// }

// class _WinnersWidgetState extends State<WinnersWidget> {
//   int selectButton = 1;

//   LeaderboardMonthly? monthlyData;
//   LeaderboardYearly? yearlyData;

//   bool isLoading = true;

//   final apiService = ApiService(); // your actual service

//   @override
//   void initState() {
//     super.initState();
//     fetchLeaderboardData(id: '1'); // fetch data for id 1, replace as needed
//   }

//   Future<void> fetchLeaderboardData({required String id}) async {
//     final monthly = await apiService.fetchLeaderboard(id);
//     final yearly = await apiService.fetchLeaderboardYear(id);

//     setState(() {
//       monthlyData = monthly;
//       yearlyData = yearly;
//       isLoading = false;
//     });
//   }

//   Widget buildHeroPlayer({
//     required String nickname,
//     required int rank,
//     required String? photo,
//     required double hourlyWin,
//     required double totalWin,
//     required double width,
//   }) {
//     return Stack(
//       children: [
//         Image.asset("assets/images/lobby/top winners/hero rank holder.png"),
//         Column(
//           children: [
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) => const ChartLineWidget(),
//                           );
//                         },
//                         child: Row(
//                           children: [
//                             SizedBox(width: 12,),
//                             CircleAvatar(
//                               radius: 20,
//                               backgroundImage: photo != null && photo.isNotEmpty
//                                   ? NetworkImage(photo)
//                                   : const AssetImage("assets/images/lobby/top winners/hero avatar holder.png") as ImageProvider,
//                               backgroundColor: Colors.grey[300],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10,),
//                     BuildSubHeadingText(
//                       text: nickname,
//                       fontSize: 14,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 10,),
//                 BuildSubHeadingText(
//                   text: "$rank",
//                   fontSize: 14,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(width: 20),
//                 BuildSubHeadingText(
//                   text: "\$${hourlyWin.toStringAsFixed(2)}",
//                   fontSize: 14,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(width: 20),
//                 BuildSubHeadingText(
//                   text: "\$${totalWin.toStringAsFixed(2)}",
//                   fontSize: 14,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(width: 20),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;

//     final currentMonthlyUser = monthlyData?.data;
//     final currentYearlyUser = yearlyData?.data;

//     return Padding(
//       padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: height / 15),
//       child: Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: EdgeInsets.zero,
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10),
//                       BuildSubHeadingText(
//                         text: selectButton == 1
//                             ? "Top February winners"
//                             : "Top winners of 2025",
//                         color: Colors.white,
//                       ),
//                       const SizedBox(height: 20),
//                       Stack(
//                         children: [
//                           Image.asset(
//                               "assets/images/lobby/top winners/Top Winners Header Button BG.png"),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () => setState(() => selectButton = 1),
//                                   child: Image.asset(
//                                     width: width / 2.2,
//                                     selectButton == 1
//                                         ? "assets/images/lobby/top winners/Monthly Winners Button Active.png"
//                                         : "assets/images/lobby/top winners/Monthly Winners Button Passive.png",
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () => setState(() => selectButton = 2),
//                                   child: Image.asset(
//                                     width: width / 2.2,
//                                     selectButton == 2
//                                         ? "assets/images/lobby/top winners/Yearly Winners Button Active.png"
//                                         : "assets/images/lobby/top winners/Yearly Winners Button Passive.png",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(width: 10),
//                           BuildSubHeadingText(
//                             text: "  Players",
//                             fontSize: 10,
//                             color: Colors.white,
//                           ),
//                           BuildSubHeadingText(
//                             text: "  Rank",
//                             fontSize: 10,
//                             color: Colors.white,
//                           ),
//                           BuildSubHeadingText(
//                             text: "  Won/Hour",
//                             fontSize: 10,
//                             color: Colors.white,
//                           ),
//                           BuildSubHeadingText(
//                             text: "  Winnings",
//                             fontSize: 10,
//                             color: Colors.white,
//                           ),
//                           SizedBox(width: 10),
//                         ],
//                       ),
//                       if (selectButton == 1 && currentMonthlyUser != null)
//                         buildHeroPlayer(
//                           nickname: currentMonthlyUser.player?.nickname ?? "Unknown",
//                           rank: currentMonthlyUser.player?.rank ?? 0,
//                           photo: currentMonthlyUser.player?.photo,
//                           hourlyWin: currentMonthlyUser.player?.hourlyWin?.toDouble() ?? 0.0,
//                           totalWin: currentMonthlyUser.player?.totalWin?.toDouble() ?? 0.0,
//                           width: width,
//                         ),
//                       if (selectButton == 2 && currentYearlyUser != null)
//                         buildHeroPlayer(
//                           nickname: currentYearlyUser.player?.nickname ?? "Unknown",
//                           rank: currentYearlyUser.player?.rank ?? 0,
//                           photo: currentYearlyUser.player?.photo,
//                           hourlyWin: currentYearlyUser.player?.hourlyWin?.toDouble() ?? 0.0,
//                           totalWin: currentYearlyUser.player?.totalWin?.toDouble() ?? 0.0,
//                           width: width,
//                         ),
//                       Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Container(
//                           width: width,
//                           height: height / 1.424,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: selectButton == 1
//                               ? const MonthlyWinnersViewWidget(id: '1',)
//                               : const YearlyWinnersView(id: '1',),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pokerpad/widget/monthly_winners_view_widget.dart';
import 'package:pokerpad/widget/yearly_winners_view.dart';

import '../model/leaderboard_monthly_model.dart';
import '../model/leaderboard_yearly_model.dart';
import '../services/api_service.dart';
import 'build_sub_heading_text.dart';

class WinnersWidget extends StatefulWidget {
  final int id;

  const WinnersWidget({super.key, required this.id});

  @override
  State<WinnersWidget> createState() => _WinnersWidgetState();
}

class _WinnersWidgetState extends State<WinnersWidget> {
  int selectButton = 1;

  LeaderboardMonthly? monthlyData;
  LeaderboardYearly? yearlyData;
  bool isLoading = true;

  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchLeaderboardData(id: widget.id.toString());
  }

  Future<void> fetchLeaderboardData({required String id}) async {
    final monthly = await apiService.fetchLeaderboard(id);
    final yearly = await apiService.fetchLeaderboardYear(id);

    setState(() {
      monthlyData = monthly;
      yearlyData = yearly;
      isLoading = false;
    });
  }

  Widget buildHeroPlayer({
    required String nickname,
    required int rank,
    required String? photo,
    required double hourlyWin,
    required double totalWin,
    required double width,
  }) {
    return Stack(
      children: [
        Image.asset("assets/images/lobby/top winners/hero rank holder.png"),
        Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (context) => const ChartLineWidget(),
                          // );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                radius: 24.5,
                                backgroundImage: photo != null &&
                                        photo.isNotEmpty
                                    ? NetworkImage(photo)
                                    : const AssetImage(
                                            "assets/images/lobby/top winners/hero avatar holder.png")
                                        as ImageProvider,
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    BuildSubHeadingText(
                      text: nickname,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(width: 1),
                BuildSubHeadingText(
                  text: "$rank",
                  fontSize: 14,
                  color: Colors.white,
                ),
                const SizedBox(width: 25),
                BuildSubHeadingText(
                  text: "\$${hourlyWin.toStringAsFixed(2)}",
                  fontSize: 14,
                  color: Colors.white,
                ),
                const SizedBox(width: 30),
                BuildSubHeadingText(
                  text: "\$${totalWin.toStringAsFixed(2)}",
                  fontSize: 14,
                  color: Colors.white,
                ),
                const SizedBox(width: 60),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final currentMonthlyUser = monthlyData?.data;
    final currentYearlyUser = yearlyData?.data;

    return Padding(
      padding:
          EdgeInsets.only(left: 20, right: 20, bottom: 10, top: height / 15),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      BuildSubHeadingText(
                        text: selectButton == 1
                            ? "Top February winners"
                            : "Top winners of 2025",
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Image.asset(
                              "assets/images/lobby/top winners/Top Winners Header Button BG.png"),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => setState(() => selectButton = 1),
                                  child: Image.asset(
                                    width: width / 2.2,
                                    selectButton == 1
                                        ? "assets/images/lobby/top winners/Monthly Winners Button Active.png"
                                        : "assets/images/lobby/top winners/Monthly Winners Button Passive.png",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => setState(() => selectButton = 2),
                                  child: Image.asset(
                                    width: width / 2.2,
                                    selectButton == 2
                                        ? "assets/images/lobby/top winners/Yearly Winners Button Active.png"
                                        : "assets/images/lobby/top winners/Yearly Winners Button Passive.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10),
                          BuildSubHeadingText(
                            text: "  Players",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          BuildSubHeadingText(
                            text: "  Rank",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          BuildSubHeadingText(
                            text: "  Won/Hour",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          BuildSubHeadingText(
                            text: "  Winnings",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      if (selectButton == 1 && currentMonthlyUser != null)
                        buildHeroPlayer(
                          nickname:
                              currentMonthlyUser.player?.nickname ?? "Unknown",
                          rank: currentMonthlyUser.player?.rank ?? 0,
                          photo: currentMonthlyUser.player?.photo,
                          hourlyWin: currentMonthlyUser.player?.hourlyWin
                                  ?.toDouble() ??
                              0.0,
                          totalWin:
                              currentMonthlyUser.player?.totalWin?.toDouble() ??
                                  0.0,
                          width: width,
                        ),
                      if (selectButton == 2 && currentYearlyUser != null)
                        buildHeroPlayer(
                          nickname:
                              currentYearlyUser.player?.nickname ?? "Unknown",
                          rank: currentYearlyUser.player?.rank ?? 0,
                          photo: currentYearlyUser.player?.photo,
                          hourlyWin:
                              currentYearlyUser.player?.hourlyWin?.toDouble() ??
                                  0.0,
                          totalWin:
                              currentYearlyUser.player?.totalWin?.toDouble() ??
                                  0.0,
                          width: width,
                        ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: width,
                          height: height / 1.424,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: selectButton == 1
                              ? MonthlyWinnersViewWidget(
                                  id: widget.id.toString())
                              : YearlyWinnersView(id: widget.id.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

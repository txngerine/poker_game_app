// import 'package:flutter/material.dart';

// import '../model/leaderboard_yearly_model.dart';
// import '../services/api_service.dart';
// import 'build_sub_heading_text.dart';
// import 'chart_line_widget.dart';

// class YearlyWinnersView extends StatefulWidget {
//   const YearlyWinnersView({super.key});

//   @override
//   State<YearlyWinnersView> createState() => _YearlyWinnersViewState();
// }

// class _YearlyWinnersViewState extends State<YearlyWinnersView> {
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
//       LeaderboardYearly? leaderboard = await _apiService.fetchLeaderboardYear();
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
//                   data: const ScrollbarThemeData(
//                     thumbColor: WidgetStatePropertyAll(Colors.grey),
//                     radius: Radius.circular(10),
//                     thickness: WidgetStatePropertyAll(17),
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

// import 'package:flutter/material.dart';
// import '../model/leaderboard_yearly_model.dart';
// import '../services/api_service.dart';
// import 'build_sub_heading_text.dart';
// import 'chart_line_widget.dart';

// class YearlyWinnersView extends StatefulWidget {
//   final String id; // Accept the id parameter

//   const YearlyWinnersView({super.key, required this.id}); // Pass the id to the constructor

//   @override
//   State<YearlyWinnersView> createState() => _YearlyWinnersViewState();
// }

// class _YearlyWinnersViewState extends State<YearlyWinnersView> {
//   final ScrollController _scrollController = ScrollController();
//   final ApiService _apiService = ApiService();

//   List<Report> _reports = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchLeaderboard();
//   }

//   Future<void> _fetchLeaderboard() async {
//     try {
//       // Use widget.id to fetch leaderboard data
//       LeaderboardYearly? leaderboard = await _apiService.fetchLeaderboardYear(widget.id);
//       if (leaderboard != null && leaderboard.data != null) {
//         setState(() {
//           _reports = leaderboard.data?.report ?? [];
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
//           : _reports.isEmpty
//               ? const Center(
//                   child: BuildSubHeadingText(
//                     text: "No data available",
//                     color: Colors.black,
//                     fontSize: 14,
//                   ),
//                 )
//               : ScrollbarTheme(
//                   data: const ScrollbarThemeData(
//                     thumbColor: WidgetStatePropertyAll(Colors.grey),
//                     radius: Radius.circular(10),
//                     thickness: WidgetStatePropertyAll(17),
//                   ),
//                   child: Scrollbar(
//                     controller: _scrollController,
//                     thumbVisibility: true,
//                     trackVisibility: true,
//                     interactive: true,
//                     child: Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: ListView.separated(
//                         controller: _scrollController,
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: _reports.length,
//                         separatorBuilder: (_, __) => const SizedBox(height: 10),
//                         itemBuilder: (context, index) {
//                           Report report = _reports[index];
//                           return Stack(
//                             children: [
//                               Image.asset(
//                                 "assets/images/lobby/top winners/villain rank holder.png",
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (context) => const ChartLineWidget(),
//                                             );
//                                           },
//                                           child: CircleAvatar(
//                                             radius: 23.5,
//                                             backgroundColor: Colors.grey[300],
//                                             backgroundImage: report.photo != null && report.photo!.isNotEmpty
//                                                 ? NetworkImage(report.photo!)
//                                                 : const AssetImage("assets/images/lobby/top winners/villain avatar holder.png") as ImageProvider,
//                                             onBackgroundImageError: (_, __) {
//                                               // Optionally handle image errors
//                                             },
//                                           ),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         BuildSubHeadingText(
//                                           text: report.nickname ?? "Unknown",
//                                           color: Colors.black,
//                                           fontSize: 12,
//                                         ),
//                                       ],
//                                     ),
//                                     Row(mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                           width: 50,
//                                           child: BuildSubHeadingText(
//                                             text: "${report.rank ?? index + 1}",
//                                             color: Colors.black,
//                                             fontSize: 12,textAlign: TextAlign.start,
//                                           ),
//                                         ),
//                                         const SizedBox(width: 45),
//                                     BuildSubHeadingText(
//                                       text: "\$${report.hourlyWin ?? "0"}",
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                     ),
//                                     const SizedBox(width: 80),
//                                     BuildSubHeadingText(
//                                       text: "\$${report.totalWin ?? "0"}",
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                     ),
//                                     const SizedBox(width: 50),
//                                       ],
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

import '../model/leaderboard_yearly_model.dart';
import '../services/api_service.dart';
import 'build_sub_heading_text.dart';
import 'chart_line_widget.dart';

class YearlyWinnersView extends StatefulWidget {
  final String id;

  const YearlyWinnersView({super.key, required this.id});

  @override
  State<YearlyWinnersView> createState() => _YearlyWinnersViewState();
}

class _YearlyWinnersViewState extends State<YearlyWinnersView> {
  final ScrollController _scrollController = ScrollController();
  final ApiService _apiService = ApiService();

  List<Report> _reports = [];
  bool _isLoading = true;
  double _thumbTop = 0.0;
  bool _isDragging = false;
  double _dragStartY = 0.0;
  double _dragStartThumbTop = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchLeaderboard();

    _scrollController.addListener(() {
      if (!_isDragging && _scrollController.position.hasContentDimensions) {
        final scrollExtent = _scrollController.position.maxScrollExtent;
        final viewport = _scrollController.position.viewportDimension;
        final thumbHeight = _getThumbHeight(viewport);
        final thumbAvailableHeight = viewport - thumbHeight;

        setState(() {
          _thumbTop =
              (_scrollController.offset / scrollExtent) * thumbAvailableHeight;
        });
      }
    });
  }

  double _getThumbHeight(double viewport) {
    final contentHeight = _reports.length * 100.0;
    final ratio = viewport / contentHeight;
    return ratio * viewport;
  }

  Future<void> _fetchLeaderboard() async {
    try {
      LeaderboardYearly? leaderboard =
          await _apiService.fetchLeaderboardYear(widget.id);
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

  void _onDragStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
      _dragStartY = details.globalPosition.dy;
      _dragStartThumbTop = _thumbTop;
    });
  }

  void _onDragUpdate(DragUpdateDetails details, double viewportHeight) {
    final dragOffset = details.globalPosition.dy - _dragStartY;
    final thumbHeight = _getThumbHeight(viewportHeight);
    final maxThumbTop = viewportHeight - thumbHeight;

    setState(() {
      _thumbTop = (_dragStartThumbTop + dragOffset).clamp(0.0, maxThumbTop);
      final scrollExtent = _scrollController.position.maxScrollExtent;
      _scrollController.jumpTo((_thumbTop / maxThumbTop) * scrollExtent);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });
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
    final thumbHeight = _getThumbHeight(height / 2.28);

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
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: ListView.separated(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _reports.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final report = _reports[index];
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
                                              builder: (context) =>
                                                  const ChartLineWidget(),
                                            );
                                          },
                                          child: CircleAvatar(
                                            radius: 23.5,
                                            backgroundColor: Colors.grey[300],
                                            backgroundImage: report.photo !=
                                                        null &&
                                                    report.photo!.isNotEmpty
                                                ? NetworkImage(report.photo!)
                                                : const AssetImage(
                                                        "assets/images/lobby/top winners/villain avatar holder.png")
                                                    as ImageProvider,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          child: BuildSubHeadingText(
                                            text: "${report.rank ?? index + 1}",
                                            color: Colors.black,
                                            fontSize: 12,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        const SizedBox(width: 45),
                                        BuildSubHeadingText(
                                          text: "\$${report.hourlyWin ?? "0"}",
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                        const SizedBox(width: 80),
                                        BuildSubHeadingText(
                                          text: "\$${report.totalWin ?? "0"}",
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                        const SizedBox(width: 50),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: _thumbTop,
                      right: 4,
                      child: GestureDetector(
                        onVerticalDragStart: _onDragStart,
                        onVerticalDragUpdate: (details) =>
                            _onDragUpdate(details, height / 1.28),
                        onVerticalDragEnd: _onDragEnd,
                        child: Container(
                          width: 20,
                          height: thumbHeight,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/scrollwheel.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

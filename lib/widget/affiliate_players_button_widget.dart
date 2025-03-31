// import 'package:flutter/material.dart';
// import 'package:pokerpad/widget/affiliate_bonuse_button_widget.dart';
// import 'package:pokerpad/widget/affiliate_players_listview.dart';
// import 'package:pokerpad/widget/build_sub_heading_text.dart';
// import 'package:provider/provider.dart';

// import '../provider/affiliated_button_provider.dart';

// class AffiliatePlayersButtonWidget extends StatefulWidget {
//   const AffiliatePlayersButtonWidget({super.key});

//   @override
//   State<AffiliatePlayersButtonWidget> createState() =>
//       _AffiliatePlayersButtonWidgetState();
// }

// class _AffiliatePlayersButtonWidgetState
//     extends State<AffiliatePlayersButtonWidget> {
//       final TextEditingController _searchController = TextEditingController();
//   String searchQuery = "";
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     final provider = Provider.of<AffiliatedButtonProvider>(context);

//     return Padding(
//       padding: const EdgeInsets.only(top: 140),
//       child: Container(
//         width: width,
//         height: height,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/images/affiliate screen/aff_bg.png"),
//                 fit: BoxFit.cover)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ClipRRect(
//                     child: Container(
//                         width: width / 2.1,
//                         height: 50,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 "assets/images/affiliate screen/aff_textfield1.png"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             BuildSubHeadingText(
//                               text: "NO.OF PLAYERS",
//                               color: Colors.white,
//                               fontSize: 10,
//                             ),
//                             BuildSubHeadingText(
//                               text: "365",
//                               color: Colors.white,
//                               fontSize: 13,
//                             ),
//                           ],
//                         )),
//                   ),
//                   ClipRRect(
//                     child: Container(
//                         width: width / 2.1,
//                         height: 50,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 "assets/images/affiliate screen/aff_texfield2.png"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             BuildSubHeadingText(
//                               text: "TOTAL RAKE",
//                               color: Colors.white,
//                               fontSize: 10,
//                             ),
//                             BuildSubHeadingText(
//                               text: "\$50,214",
//                               color: Colors.white,
//                               fontSize: 13,
//                             ),
//                           ],
//                         )),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       provider.setClicked(false);
//                       Navigator.pop(context);
//                       provider.toggleBonusClicked(false);
//                     },
//                     child: Image.asset(
//                         width: width / 4.2,
//                         "assets/images/affiliate screen/players active.png"),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       print("clicked bonus button");
//                       provider.toggleBonusClicked(true);
//                       showDialog(
//                         barrierDismissible: false,
//                         context: context,
//                         builder: (context) {
//                           return const AffiliateBonusButtonWidget();
//                         },
//                       );
//                     },
//                     child: Image.asset(
//                         width: width / 4.2,
//                         "assets/images/affiliate screen/bonuses passive.png"),
//                   ),
//                   ClipRRect(
//                     child: Container(
//                         width: width / 2.1,
//                         height: 50,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 "assets/images/affiliate screen/aff_texfield2.png"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             BuildSubHeadingText(
//                               text: "YOUR COMMISSION",
//                               color: Colors.white,
//                               fontSize: 10,
//                             ),
//                             BuildSubHeadingText(
//                               text: "\$36,214",
//                               color: Colors.white,
//                               fontSize: 13,
//                             ),
//                           ],
//                         )),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: ClipRRect(
//                   child: Container(
//                     width: width,
//                     height: height / 13,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage(
//                                 "assets/images/affiliate screen/search frame.png"))),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const SizedBox(
//                           width: 3,
//                         ),
//                         SizedBox(
//                           width: 80,
//                           height: 50,
//                           child: Material(
//                             color: Colors.transparent,
//                             child: TextField(
//                               controller: _searchController,
//                               decoration: const InputDecoration(
//                                 hintText: "   SEARCH",
//                                 hintStyle: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 11,
//                                 ),
//                                 contentPadding:
//                                     EdgeInsets.symmetric(horizontal: 10),
//                                 border: InputBorder.none,
//                               ),
//                               style: const TextStyle(color: Colors.white70),
//                               onChanged: (value) {
//                                 setState(() {
//                                   searchQuery = value;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         const BuildSubHeadingText(
//                           text: "TRANSFER",
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                         const BuildSubHeadingText(
//                           text: "BALANCE",
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                         const BuildSubHeadingText(
//                           text: "WINNINGS",
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                         const BuildSubHeadingText(
//                           text: "RAKE",
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                         const BuildSubHeadingText(
//                           text: "COMMISSION",
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//                AffiliatePlayersListview(
//                   searchQuery: searchQuery,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:pokerpad/widget/affiliate_bonuse_button_widget.dart';
import 'package:pokerpad/widget/affiliate_players_listview.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:provider/provider.dart';

import '../provider/affiliated_button_provider.dart';

class AffiliatePlayersButtonWidget extends StatefulWidget {
  const AffiliatePlayersButtonWidget({super.key});

  @override
  State<AffiliatePlayersButtonWidget> createState() =>
      _AffiliatePlayersButtonWidgetState();
}

class _AffiliatePlayersButtonWidgetState
    extends State<AffiliatePlayersButtonWidget> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  String sortedColumn = "";
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<AffiliatedButtonProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 140),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/affiliate screen/aff_bg.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Container(
                        width: width / 2.1,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/affiliate screen/aff_textfield1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BuildSubHeadingText(
                              text: "NO.OF PLAYERS",
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            BuildSubHeadingText(
                              text: "365",
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ],
                        )),
                  ),
                  ClipRRect(
                    child: Container(
                        width: width / 2.1,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/affiliate screen/aff_texfield2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BuildSubHeadingText(
                              text: "TOTAL RAKE",
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            BuildSubHeadingText(
                              text: "\$50,214",
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.setClicked(false);
                      Navigator.pop(context);
                      provider.toggleBonusClicked(false);
                    },
                    child: Image.asset(
                        width: width / 4.2,
                        "assets/images/affiliate screen/players active.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked bonus button");
                      provider.toggleBonusClicked(true);
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const AffiliateBonusButtonWidget();
                        },
                      );
                    },
                    child: Image.asset(
                        width: width / 4.2,
                        "assets/images/affiliate screen/bonuses passive.png"),
                  ),
                  ClipRRect(
                    child: Container(
                        width: width / 2.1,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/affiliate screen/aff_texfield2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BuildSubHeadingText(
                              text: "YOUR COMMISSION",
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            BuildSubHeadingText(
                              text: "\$36,214",
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipRRect(
                  child: Container(
                    width: width,
                    height: height / 13,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/affiliate screen/search frame.png"))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        SizedBox(
                          width: 80,
                          height: 50,
                          child: Material(
                            color: Colors.transparent,
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintText: "   SEARCH",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(color: Colors.white70),
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        _buildSortableColumn("TRANSFER"),
                        _buildSortableColumn("BALANCE"),
                        _buildSortableColumn("WINNINGS"),
                        _buildSortableColumn("RAKE"),
                        _buildSortableColumn("COMMISSION"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AffiliatePlayersListview(
                  searchQuery: searchQuery,
                  sortColumn: sortedColumn,
                  isAscending: isAscending,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build a sortable column header
  Widget _buildSortableColumn(String columnName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (sortedColumn == columnName) {
            isAscending = !isAscending;
          } else {
            sortedColumn = columnName;
            isAscending = true;
          }
        });
      },
      child: Row(
        children: [
          BuildSubHeadingText(
            text: columnName,
            color: Colors.white,
            fontSize: 10,
          ),
          Icon(
            sortedColumn == columnName
                ? (isAscending ? Icons.arrow_upward : Icons.arrow_downward)
                : Icons.swap_vert,
            size: 12,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

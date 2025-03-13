import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/affiliated_button_provider.dart';
import 'affiliate_players_listview.dart';
import 'build_sub_heading_text.dart';

class AffiliateBonusButtonWidget extends StatefulWidget {
  const AffiliateBonusButtonWidget({super.key});

  @override
  State<AffiliateBonusButtonWidget> createState() =>
      _AffiliateBonusButtonWidgetState();
}

class _AffiliateBonusButtonWidgetState
    extends State<AffiliateBonusButtonWidget> {
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
                        child: Row(
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
                        child: Row(
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
                      provider.toggleBonusClicked(false);
                      Navigator.pop(context);
                      // Navigator.pop(context);
                      //
                      // setState(() {
                      //   showDialog(
                      //     barrierDismissible: false,
                      //     context: context,
                      //     builder: (context) {
                      //       return AffiliatePlayersButtonWidget();
                      //     },
                      //   );
                      // });
                    },
                    child: Image.asset(
                        width: width / 4.2,
                        "assets/images/affiliate screen/players passive.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.setClicked(false);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      provider.toggleBonusClicked(true);
                    },
                    child: Image.asset(
                        width: width / 4.2,
                        "assets/images/affiliate screen/bonuses active.png"),
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
                        child: Row(
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 3,
                        ),
                        SizedBox(
                          width: 80,
                          height: 50,
                          child: Material(
                            color: Colors.transparent,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "   SEARCH",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 11),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        BuildSubHeadingText(
                          text: "TRANSFER",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        BuildSubHeadingText(
                          text: "BALANCE",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        BuildSubHeadingText(
                          text: "WINNINGS",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        BuildSubHeadingText(
                          text: "RAKE",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        BuildSubHeadingText(
                          text: "COMMISSION",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const AffiliatePlayersListview()
            ],
          ),
        ),
      ),
    );
  }
}

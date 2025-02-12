import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerpad/widget/affiliate_balance_section.dart';
import 'package:pokerpad/widget/affiliate_location_widget.dart';
import 'package:pokerpad/widget/affiliate_phone_verification_widget.dart';
import 'package:pokerpad/widget/affiliate_players_section.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

class AffiliateButtonViewWidget extends StatefulWidget {
  const AffiliateButtonViewWidget({super.key});

  @override
  State<AffiliateButtonViewWidget> createState() =>
      _AffiliateButtonViewWidgetState();
}

class _AffiliateButtonViewWidgetState extends State<AffiliateButtonViewWidget> {
  int currentPage = 1;
  final int itemsPerPage = 8;
  final int totalItems = 47;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Affiliate/affiliate background.png",
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Affiliate/Refresh Button.png",
                    width: width / 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        // barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height / 1.1,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    35,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          width: width / 2,
                                          "assets/images/Affiliate/verify phone alert/affiliate player view - image.png"),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            BuildSubHeadingText(
                                                text: "whateverman"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Icon(Icons.mail_outline),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                BuildTextWidget(
                                                    text:
                                                        "whateverman@gmail.com")
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                AffiliatePhoneVerificationWidget(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons.call),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                BuildTextWidget(
                                                  text: "8086433988",
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                AffiliateLocationWidget(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                    Icons.location_on_outlined),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                BuildTextWidget(
                                                  text: "Ernakulam",
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Stack(
                                              children: [
                                                Image.asset(
                                                    width: width / 2,
                                                    "assets/images/Affiliate/verify phone alert/introduction.png"),
                                                Positioned(
                                                  top: 10, bottom: 10,
                                                  left:
                                                      20, // Adjust position as needed
                                                  right:
                                                      20, // Adjust width as needed
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: TextField(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.white70),
                                                      decoration:
                                                          InputDecoration(
                                                        hintMaxLines: 6,
                                                        hintText:
                                                            "Introduce yourself.Which local casinos do you frequent and which games do you usually play? invite your players to reach out to you in case they need any type of assistance!",
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.white70),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Image.asset(
                                        "assets/images/Affiliate/verify phone alert/contact preferences.png",
                                        width: MediaQuery.sizeOf(context).width,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 10, bottom: 10,
                                        left: 20, // Adjust position as needed
                                        right: 20, // Adjust width as needed
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            style: TextStyle(
                                                color: Colors.white70),
                                            decoration: InputDecoration(
                                              hintText:
                                                  "What is the best way to contact you? Do you have whatsapp",
                                              hintStyle: TextStyle(
                                                  color: Colors.white70),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                      "assets/images/Affiliate/verify phone alert/disclaimer.png")
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      "assets/images/Affiliate/profile button passive (2).png",
                      width: width / 10,
                    ),
                  ),
                  Image.asset(
                    "assets/images/Affiliate/bonuses button passive.png",
                    width: width / 3.4,
                  ),
                  Image.asset(
                    "assets/images/Affiliate/affiliate button active (2).png",
                    width: width / 3.4,
                  ),
                  Image.asset(
                    "assets/images/Affiliate/info button active (2).png",
                    width: width / 10,
                  ),
                  Image.asset(
                    "assets/images/Affiliate/pp logo button passive (2).png",
                    width: width / 10,
                  )
                ],
              ),
              Row(
                children: [
                  AffiliateBalanceSection(),
                  AffiliatePlayersSection()
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/Affiliate/total rake text holder.png",
                        width: width / 2,
                      ),
                      Positioned(
                        top: 12,
                        left: width / 2.7,
                        child: Text(
                          "\$50,000",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/Affiliate/total commission holder.png",
                        width: width / 2,
                      ),
                      Positioned(
                        top: 12,
                        left: width / 2.7,
                        child: Text(
                          "\$36,214",
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
                            Image.asset(
                                "assets/images/Affiliate/Affiliate bar.png"),
                            const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  BuildTextWidget(
                                    text: "SEARCH",
                                    fontSize: 10,
                                  ),
                                  SizedBox(
                                    width: 48,
                                  ),
                                  BuildTextWidget(
                                    text: "TRANSFER",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  BuildTextWidget(
                                    text: " PLAYER'S \n BALANCE",
                                    fontSize: 10,
                                  ),
                                  BuildTextWidget(
                                    text: "   WINNING \n AFTER RAKE",
                                    fontSize: 10,
                                  ),
                                  BuildTextWidget(
                                    text: " RAKE \n PAID",
                                    fontSize: 10,
                                  ),
                                  BuildTextWidget(
                                    text: "   AFFILIATE \n COMMISSION",
                                    fontSize: 10,
                                  ),
                                  SizedBox(
                                    width: 1,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height / 1.76,
                          child: ListView.builder(
                            itemCount: itemsPerPage,
                            itemBuilder: (context, index) {
                              int actualIndex =
                                  (currentPage - 1) * itemsPerPage + index;
                              if (actualIndex >= totalItems) return SizedBox();
                              return Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                          "assets/images/Affiliate/2nd layer box.png"),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: width / 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Image.asset(
                                                "assets/images/Affiliate/winning player.png",
                                                width: width / 10,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "ID:#${actualIndex + 1}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "CHARLIE007",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/Affiliate/SEND BUTTON ALERT.png",
                                              width: width / 8,
                                            ),
                                            Text(
                                              "\$432,678",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "\$43,632",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "\$50,000",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "\$500",
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
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (currentPage > 1) {
                                  setState(() {
                                    currentPage--;
                                  });
                                }
                              },
                              child: Image.asset(
                                  "assets/images/Affiliate/previous page.png",
                                  width: width / 10),
                            ),
                            Text(
                                "$currentPage/${(totalItems / itemsPerPage).ceil()}",
                                style: const TextStyle(color: Colors.white)),
                            GestureDetector(
                              onTap: () {
                                if (currentPage <
                                    (totalItems / itemsPerPage).ceil()) {
                                  setState(() {
                                    currentPage++;
                                  });
                                }
                              },
                              child: Image.asset(
                                  "assets/images/Affiliate/next page.png",
                                  width: width / 10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

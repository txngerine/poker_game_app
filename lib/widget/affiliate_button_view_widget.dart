import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AffiliateButtonViewWidget extends StatefulWidget {
  const AffiliateButtonViewWidget({super.key});

  @override
  State<AffiliateButtonViewWidget> createState() =>
      _AffiliateButtonViewWidgetState();
}

class _AffiliateButtonViewWidgetState extends State<AffiliateButtonViewWidget> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
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
                  Image.asset(
                    "assets/images/Affiliate/profile button passive (2).png",
                    width: width / 10,
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
                  Stack(
                    children: [
                      Image.asset(
                          width: width / 2,
                          "assets/images/Affiliate/balance place holder.png"),
                      Positioned(
                        left: width / 3,
                        bottom: height / 14,
                        child: Text(
                          "36,2948",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: width / 20,
                        top: height / 17,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Affiliate/Aff Deposit Button.png",
                              width: width / 5,
                            ),
                            Image.asset(
                              "assets/images/Affiliate/Aff withdraw button.png",
                              width: width / 5,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/Affiliate/no. of players placeholder.png",
                        width: width / 2,
                      ),
                      Positioned(
                        left: width / 2.5,
                        bottom: height / 14,
                        child: Text(
                          "394",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: width / 20,
                        top: height / 17,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Affiliate/Aff History Button .png",
                              width: width / 5,
                            ),
                            Image.asset(
                              "assets/images/Affiliate/Aff Transfer Button.png",
                              width: width / 5,
                            )
                          ],
                        ),
                      )
                    ],
                  )
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
                          "50,000",
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
                          "36,214",
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
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 3),
                    child: Column(
                      children: [
                        Image.asset(
                            "assets/images/Affiliate/Affiliate bar.png"),
                        SizedBox(
                          height: height / 1.7,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                          "assets/images/Affiliate/2nd layer box.png"),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 3, right: width / 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                              "assets/images/Affiliate/winning player.png",
                                              width: width / 9,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "ID:#123",
                                                  style: TextStyle(
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
                                              "432,678",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "43,632",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "50,000",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "500",
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
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                width: width / 10,
                                "assets/images/Affiliate/previous page.png"),
                            Text(
                              "1/47",
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset(
                              "assets/images/Affiliate/next page.png",
                              width: width / 10,
                            )
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

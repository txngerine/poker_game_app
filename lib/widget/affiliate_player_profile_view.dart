import 'package:flutter/material.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../model/login_response_model.dart';

class AffiliatePlayerProfileView extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const AffiliatePlayerProfileView({super.key, this.playerResponse});

  @override
  State<AffiliatePlayerProfileView> createState() =>
      _AffiliatePlayerProfileViewState();
}

class _AffiliatePlayerProfileViewState
    extends State<AffiliatePlayerProfileView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Stack(
        children: [
          Container(
            width: width / 1,
            height: height / 1.6,
            child: Image.asset(
              "assets/images/playerAffiliate/affiliate_profile_combined.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 83,
            left: 55,
            child: Container(
              height: height / 3.2,
              width: width / 2.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.playerResponse!.data!.lobbyAvatar.toString())),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildSubHeadingText(
                      text: widget.playerResponse!.data!.nickname.toString(),
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                    BuildSubHeadingText(
                      text: "ID:${widget.playerResponse!.data!.id.toString()}",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 83,
            left: 329,
            child: Container(
              height: height / 3.2,
              width: width / 2.8,
              // height: 298,
              // width: 240,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    const BuildTextWidget(
                      text:
                          "Affiliate partners are independent entities and do not act as employees or representatives of PokerPad Ltd."
                          "Consequently, PokerPad Ltd. disclaims any liability for outcomers resulting from user interactions with affiliate partners,encompassing any ransactions and agreements.",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                            width: 15,
                            height: 20,
                            "assets/images/playerAffiliate/phone icon (1).png"),
                        SizedBox(
                          width: 10,
                        ),
                        BuildTextWidget(
                          text: "808 643 3988",
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                            width: 15,
                            height: 20,
                            "assets/images/playerAffiliate/mail icon (1).png"),
                        SizedBox(
                          width: 10,
                        ),
                        BuildTextWidget(
                          text: "tryme4@gmail.com",
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // BuildTextWidget(
                    //   text:
                    //       "warning:Exercise caution and conduct due diligence when dealing with affiliate partners.",
                    //   fontSize: 13,
                    //   fontWeight: FontWeight.w400,
                    //   color: Colors.white,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 414,
            left: 56,
            child: Container(
              height: height / 9.5,
              width: width / 1.23,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildSubHeadingText(
                    text: "DISCLAIMER",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  BuildTextWidget(
                    text:
                        "Affiliate partners are independent entities and do not act as employees or \nrepresentatives of PokerPad Ltd."
                        "Consequently, PokerPad Ltd. disclaims any \nliability for outcomers resulting from user interactions with affiliate partners, \nencompassing any ransactions and agreements.",
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

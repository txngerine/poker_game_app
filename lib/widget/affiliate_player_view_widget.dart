import 'package:flutter/material.dart';
import 'package:pokerpad/widget/affiliate_player_profile_view.dart';

import 'affiliate_player_request_widget.dart';
import 'affiliate_player_transfer_widget.dart';

class AffiliatePlayerViewWidget extends StatefulWidget {
  const AffiliatePlayerViewWidget({super.key});

  @override
  State<AffiliatePlayerViewWidget> createState() =>
      _AffiliatePlayerViewWidgetState();
}

class _AffiliatePlayerViewWidgetState extends State<AffiliatePlayerViewWidget> {
  int selectedButton = 1;
  void updateContent(int buttonNumber) {
    setState(() {
      selectedButton = buttonNumber;
    });
  }

  Widget getSelectedContent() {
    switch (selectedButton) {
      case 1:
        return const AffiliatePlayerProfileView();
      case 2:
        return const AffiliatePlayerTransferWidget();
      case 3:
        return const AffiliatePlayerRequestWidget();
      default:
        return const Center(
          child: Text(
            "🤖",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Affiliate/player-view/overlay (2).png",
            fit: BoxFit.cover,
            color: Colors.black,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      updateContent(1);
                    },
                    child: selectedButton == 1
                        ? Image.asset(
                            "assets/images/Affiliate/player-view/affiliate button active (4).png",
                            width: width / 3.9,
                          )
                        : Image.asset(
                            "assets/images/Affiliate/player-view/affiliate button passive (4).png",
                            width: width / 3.9,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateContent(2);
                    },
                    child: Image.asset(
                      selectedButton == 2
                          ? "assets/images/Affiliate/player-view/transfer button actiive.png"
                          : "assets/images/Affiliate/player-view/transfer button passive (2).png",
                      width: width / 3.6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateContent(3);
                    },
                    child: Image.asset(
                      selectedButton == 3
                          ? "assets/images/Affiliate/player-view/request button active.png"
                          : "assets/images/Affiliate/player-view/request button passive.png",
                      width: width / 3.9,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateContent(4);
                    },
                    child: Image.asset(
                      selectedButton == 4
                          ? "assets/images/Affiliate/player-view/info button passive (4).png"
                          : "assets/images/Affiliate/player-view/info button active (4).png",
                      width: width / 10,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/Affiliate/player-view/Logo active (4).png",
                      width: width / 10,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                height: height / 1.1,
                child: getSelectedContent(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

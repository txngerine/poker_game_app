import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerpad/widget/affiliate_profile_button.dart';
import 'package:pokerpad/widget/affiliate_view_widget.dart';
import 'package:pokerpad/widget/bonuses_view_widget.dart';

class AffiliateButtonViewWidget extends StatefulWidget {
  const AffiliateButtonViewWidget({super.key});

  @override
  State<AffiliateButtonViewWidget> createState() =>
      _AffiliateButtonViewWidgetState();
}

class _AffiliateButtonViewWidgetState extends State<AffiliateButtonViewWidget> {
  int selectedButton = 1;

  void updateContent(int buttonNumber) {
    setState(() {
      selectedButton = buttonNumber;
    });
  }

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
                  const AffiliateProfileButton(),
                  GestureDetector(
                    onTap: () {
                      updateContent(2);
                      print('clicked bonuses button');
                    },
                    child: selectedButton == 2
                        ? Image.asset(
                            "assets/images/Affiliate/bonuses button active.png",
                            width: width / 3.4,
                          )
                        : Image.asset(
                            "assets/images/Affiliate/bonuses button passive.png",
                            width: width / 3.4,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateContent(1);
                    },
                    child: selectedButton == 1
                        ? Image.asset(
                            "assets/images/Affiliate/affiliate button active (2).png",
                            width: width / 3.4,
                          )
                        : Image.asset(
                            "assets/images/Affiliate/affiliate button passive (2).png",
                            width: width / 3.4,
                          ),
                  ),
                  Image.asset(
                    "assets/images/Affiliate/info button active (2).png",
                    width: width / 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/Affiliate/pp logo button passive (2).png",
                      width: width / 10,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 1.08,
                width: width,
                child: selectedButton == 1
                    ? const AffiliateViewWidget()
                    : const BonusesViewWidget(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

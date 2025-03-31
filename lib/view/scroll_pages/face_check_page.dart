import 'package:flutter/material.dart';

import '../../widget/build_heading_widget.dart';
import '../../widget/build_text_widget.dart';

class FaceCheckPage extends StatefulWidget {
  const FaceCheckPage({super.key});

  @override
  State<FaceCheckPage> createState() => _FaceCheckPageState();
}

class _FaceCheckPageState extends State<FaceCheckPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/gender&avatar/log-reg frame.png',
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              BuildHeadingWidget(text: "Face Check"),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                  width: width / 5,
                  "assets/images/gender&avatar/face unlock icon.png"),
              SizedBox(
                height: 90,
              ),
              BuildTextWidget(
                align: TextAlign.center,
                text:
                    'Let\'s take a "passport-style" \n photo to capture your \nface biometrics!',
                fontSize: 20,
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_full.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../widget/build_heading_widget.dart';

class LightPage extends StatefulWidget {
  const LightPage({super.key});

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
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
              BuildHeadingWidget(text: "Light"),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                  width: width / 5,
                  "assets/images/gender&avatar/light icon.png"),
              SizedBox(
                height: 90,
              ),
              const Text.rich(
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF5F6368),
                    fontWeight: FontWeight.w400),
                TextSpan(
                  text: 'Choose a  ',
                  children: [
                    TextSpan(
                      text: 'bright ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold), // Make bold
                    ),
                    TextSpan(text: "space\n and face the light source!"),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 110,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_full.png"),
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

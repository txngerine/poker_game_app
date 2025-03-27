import 'package:flutter/material.dart';

import '../../widget/build_heading_widget.dart';
import '../../widget/build_text_widget.dart';

class AccessoriesPage extends StatefulWidget {
  const AccessoriesPage({super.key});

  @override
  State<AccessoriesPage> createState() => _AccessoriesPageState();
}

class _AccessoriesPageState extends State<AccessoriesPage> {
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
              BuildHeadingWidget(text: "Accessories"),
              SizedBox(
                height: 60,
              ),
              Image.asset(
                  width: width / 5,
                  "assets/images/gender&avatar/accessories icon.png"),
              SizedBox(
                height: 90,
              ),
              BuildTextWidget(
                align: TextAlign.center,
                text:
                    'Remove accessories that\n cover your face, like hats, \n sunglasses, or scarves. ',
                fontSize: 20,
              ),
              SizedBox(
                height: 130,
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
                      "assets/images/gender&avatar/page indicator_empty.png"),
                  Image.asset(
                      height: height / 28,
                      "assets/images/gender&avatar/page indicator_full.png"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

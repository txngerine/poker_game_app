import 'package:flutter/material.dart';
import 'package:pokerpad/widget/affiliate_text_field_widget.dart';

class AffiliateLocationWidget extends StatefulWidget {
  const AffiliateLocationWidget({super.key});

  @override
  State<AffiliateLocationWidget> createState() =>
      _AffiliateLocationWidgetState();
}

class _AffiliateLocationWidgetState extends State<AffiliateLocationWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return Dialog(
                backgroundColor: Colors.transparent,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 5),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            "assets/images/Affiliate/verify phone alert/location background.png"),
                        Padding(
                          padding: EdgeInsets.only(top: height / 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const AffiliateTextFieldWidget(
                                hintText: "Your new location",
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                    width: width / 1.5,
                                    "assets/images/Affiliate/verify phone alert/change location button.png"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        );
      },
      child: Image.asset(
          width: width / 16,
          "assets/images/Affiliate/verify phone alert/edit icon.png"),
    );
  }
}

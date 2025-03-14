import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';
import 'build_text_widget.dart';

class AffiliatePlayerProfileView extends StatefulWidget {
  const AffiliatePlayerProfileView({super.key});

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
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.sizeOf(context).height / 1.1,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: const Color(0xff272829),
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
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const BuildSubHeadingText(
                          text: "whateverman",
                          color: Colors.white,
                          fontSize: 29,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.call,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            BuildTextWidget(
                              text: "8086433988",
                              color: Colors.white70,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.mail,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            BuildTextWidget(
                              text: "whateverman@gmail.com",
                              color: Colors.white70,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            BuildTextWidget(
                              text: "Ernakulam",
                              color: Colors.white70,
                            )
                          ],
                        ),
                        SizedBox(
                          height: height / 5,
                          width: width / 2.3,
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.white70),
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 12,
                width: width,
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                      style: TextStyle(color: Colors.white70),
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    "assets/images/Affiliate/verify phone alert/disclaimer.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';

class TransferHistoryWidget extends StatefulWidget {
  const TransferHistoryWidget({super.key});

  @override
  State<TransferHistoryWidget> createState() => _TransferHistoryWidgetState();
}

class _TransferHistoryWidgetState extends State<TransferHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Dialog(
        alignment: Alignment.topCenter,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width / 1,
          height: MediaQuery.sizeOf(context).height / 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                'assets/images/transfer (2)/transferhistory/bank frame (3).png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 58,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                            "assets/images/transfer (2)/transferhistory/2nd layer (1).png"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                      width: width / 1.1,
                                      "assets/images/transfer (2)/transferhistory/search tab (1).png"),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 25, left: 35, right: 35),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        BuildSubHeadingText(
                                          text: "search",
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 95,
                                        ),
                                        BuildSubHeadingText(
                                          text: "time",
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        BuildSubHeadingText(
                                          text: "date",
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        BuildSubHeadingText(
                                          text: "amount",
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  width: width / 1.23,
                                  height: height / 4.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.transparent,
                                  ),
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(top: 12),
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Image.asset(
                                              "assets/images/transfer (2)/transferhistory/player frame (3).png"),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, right: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        width: width / 9,
                                                        height: height / 17,
                                                        "assets/images/affiliate screen/winning player (1).png"),
                                                    Column(
                                                      children: [
                                                        BuildSubHeadingText(
                                                          text: "id#:123",
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                        BuildSubHeadingText(
                                                          text: "charlie",
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                BuildSubHeadingText(
                                                  text: "15:38(pt)",
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                                BuildSubHeadingText(
                                                  text: "2/13/2025",
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                                BuildSubHeadingText(
                                                  text: "\$43,638",
                                                  color: Colors.green,
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            width: width / 2.4,
                            "assets/images/transfer (2)/transferhistory/history active (1).png"),
                        Image.asset(
                          "assets/images/transfer (2)/transferhistory/transfer passive (1).png",
                          width: width / 2.4,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

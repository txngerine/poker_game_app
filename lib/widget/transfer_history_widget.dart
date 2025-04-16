import 'package:flutter/material.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';

class TransferHistoryWidget extends StatefulWidget {
  const TransferHistoryWidget({super.key});

  @override
  State<TransferHistoryWidget> createState() => _TransferHistoryWidgetState();
}

class _TransferHistoryWidgetState extends State<TransferHistoryWidget> {
  final TextEditingController searchController = TextEditingController();

  List<String> allNames = [];
  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();
    allNames = List.generate(10, (index) => "charlie${index + 1}");
    filteredNames = List.from(allNames);

    searchController.addListener(() {
      setState(() {
        filteredNames = allNames
            .where((name) => name
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

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
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                      width: width / 1.1,
                                      "assets/images/transfer (2)/transferhistory/search tab (1).png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 35, right: 35),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        SizedBox(
                                          child: Material(
                                            color: Colors.transparent,
                                            child: SizedBox(
                                              width: 67,
                                              height: 17,
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                controller: searchController,
                                                cursorColor: Colors.white,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "SEARCH",
                                                        hintStyle: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 75,
                                        ),
                                        const BuildSubHeadingText(
                                          text: "time",
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        const BuildSubHeadingText(
                                          text: "date",
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        const BuildSubHeadingText(
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
                                    itemCount: filteredNames.length,
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
                                                          text:
                                                              "id#:12${index + 1}",
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                        BuildSubHeadingText(
                                                          text: filteredNames[
                                                              index],
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const BuildSubHeadingText(
                                                  text: "15:38(pt)",
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                                const BuildSubHeadingText(
                                                  text: "2/13/2025",
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                                const BuildSubHeadingText(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/transfer (2)/transferhistory/transfer passive (1).png",
                            width: width / 2.4,
                          ),
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

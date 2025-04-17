import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokerpad/model/get_transfer_history_model.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';

import '../model/login_response_model.dart';

class TransferHistoryWidget extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const TransferHistoryWidget({super.key, this.playerResponse});

  @override
  State<TransferHistoryWidget> createState() => _TransferHistoryWidgetState();
}

class _TransferHistoryWidgetState extends State<TransferHistoryWidget> {
  final TextEditingController searchController = TextEditingController();
  List<Datum> transferList = [];
  List<Datum> filteredTransferList = [];

  @override
  void initState() {
    super.initState();
    getTransferHistory();
    print("id:${widget.playerResponse?.data?.id}");
    searchController.addListener(() {
      setState(() {
        filteredTransferList = transferList.where((item) {
          final nickname =
              nicknameValues.reverse[item.nickname]?.toLowerCase() ?? '';
          return nickname.contains(searchController.text.toLowerCase());
        }).toList();
      });
    });
  }

  Future<void> getTransferHistory() async {
    final playerId = widget.playerResponse?.data?.id;

    if (playerId == null) {
      print("Player ID is null. Cannot fetch transfer history.");
      return;
    }

    final url =
        "http://3.6.170.253:1080/server.php/api/v1/player-transfer-history/$playerId";
    print("Requesting URL: $url");

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        final transferHistory = GetTransferHistoryModel.fromJson(response.data);

        if (transferHistory.status == "OK") {
          print("✅ Transfer History Loaded Successfully");

          setState(() {
            transferList = transferHistory.data?.data ?? [];
            filteredTransferList = List.from(transferList);
          });
        } else {
          print("❌ API returned failure: ${transferHistory.status}");
        }
      } else {
        print("❌ HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      print("❗ Exception occurred while fetching history: $e");
    }
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
                                    itemCount: filteredTransferList.length,
                                    itemBuilder: (context, index) {
                                      final item = filteredTransferList[index];
                                      final createdAt = item.createdAt;

                                      final formattedDate = createdAt != null
                                          ? DateFormat('dd-MM-yyyy')
                                              .format(createdAt)
                                          : '';
                                      final formattedTime = createdAt != null
                                          ? DateFormat('HH:mm:ss')
                                              .format(createdAt)
                                          : '';
                                      print(nicknameValues
                                          .reverse[item.nickname]);

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
                                                    Container(
                                                      width: width / 9,
                                                      height: height / 17,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/affiliate screen/winning player (1).png"))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 3),
                                                        child: Center(
                                                          child: ClipOval(
                                                            child:
                                                                Image.network(
                                                              item.avatar ?? "",
                                                              width:
                                                                  width / 14.5,
                                                              height:
                                                                  height / 22.6,
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Icon(Icons
                                                                      .person),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width / 8,
                                                      child: Column(
                                                        children: [
                                                          BuildSubHeadingText(
                                                            text: item
                                                                .playerIdRef
                                                                .toString(),
                                                            // "id#:12${index + 1}",
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                          BuildSubHeadingText(
                                                            text: nicknameValues
                                                                .reverse[item
                                                                    .nickname]
                                                                .toString(),
                                                            // filteredNames[
                                                            //     index],
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: width / 6,
                                                  child: BuildSubHeadingText(
                                                    text: formattedTime,
                                                    // "15:38(pt)",
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width / 7,
                                                  child: BuildSubHeadingText(
                                                    text: formattedDate,
                                                    // "2/13/2025",
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                BuildSubHeadingText(
                                                  text: "\$${item.chip}",
                                                  color: Colors.green,
                                                  fontSize: 10,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                )
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

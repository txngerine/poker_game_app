import 'package:flutter/material.dart';
import 'package:pokerpad/provider/transfer_button_provider.dart';
import 'package:pokerpad/widget/build_text_widget.dart';
import 'package:pokerpad/widget/custom_transfer_text_field.dart';
import 'package:pokerpad/widget/transfer_history_widget.dart';
import 'package:provider/provider.dart';

import 'build_button_image_widget.dart';

class TransferButtonWidget extends StatefulWidget {
  const TransferButtonWidget({super.key});

  @override
  State<TransferButtonWidget> createState() => _TransferButtonWidgetState();
}

class _TransferButtonWidgetState extends State<TransferButtonWidget> {
  bool isMarked = false;
  void toggleMarker() {
    setState(() {
      isMarked = !isMarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<TransferButtonProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.setClick(true);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            bool isMarked = false; // Local state for dialog

            return StatefulBuilder(
              builder: (context, setState) {
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
                            'assets/images/transfer (2)/bank frame (3).png',
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 58, left: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        const CustomTransferTextField(
                                            hintText: "Transfer Player ID:"),
                                        const CustomTransferTextField(
                                            hintText: "Transfer to Amount\$:"),
                                        const CustomTransferTextField(
                                          hintText: "Password",
                                          keyboardType: TextInputType.text,
                                        ),
                                        const BuildTextWidget(
                                          text: "Forgot Password",
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isMarked = !isMarked;
                                                });
                                              },
                                              child: Image.asset(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    24,
                                                isMarked
                                                    ? "assets/images/CASHIER Button/TRANSFER/black check.png"
                                                    : "assets/images/CASHIER Button/TRANSFER/black check emty.png",
                                              ),
                                            ),
                                            const BuildTextWidget(
                                              text: "Remember Password",
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          "assets/images/CASHIER Button/TRANSFER/transfer alert holder.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.4,
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.4,
                                        "assets/images/transfer (2)/avatar frame (4).png"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const TransferHistoryWidget();
                                          },
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/CASHIER Button/TRANSFER/history button.png",
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.4,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        provider.setClick(false);
                                      },
                                      child: Image.asset(
                                        "assets/images/CASHIER Button/TRANSFER/transfer button.png",
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.4,
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
              },
            );
          },
        );
      },
      child: BuildButtonImageWidget(
        imgPath: provider.isClicked
            ? "assets/images/lobby/Transfer Button active.png"
            : "assets/images/lobby/transfer button passive.png",
      ),
    );
  }
}

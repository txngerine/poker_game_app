import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokerpad/controller/forgot_password_controller.dart';
import 'package:pokerpad/controller/transfer_controller.dart';
import 'package:pokerpad/model/forgot_password_model.dart';
import 'package:pokerpad/provider/transfer_button_provider.dart';
import 'package:pokerpad/widget/transfer_forgot_password_widget.dart';
import 'package:pokerpad/widget/transfer_history_widget.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import '../model/transfer_request_model.dart';
import 'build_button_image_widget.dart';
import 'build_text_widget.dart';
import 'custom_transfer_text_field.dart';

class TransferButtonWidget extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const TransferButtonWidget({super.key, this.playerResponse});

  @override
  State<TransferButtonWidget> createState() => _TransferButtonWidgetState();
}

class _TransferButtonWidgetState extends State<TransferButtonWidget> {
  bool isMarked = false;
  bool isLoading = false;
  final ForgotPasswordController forgotPasswordController =
      ForgotPasswordController();
  TransferController transferController = TransferController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController playerIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  Future<void> forgotPassword() async {
    setState(() {
      isLoading = true;
    });

    final request = ForgotPasswordRequestModel(
      email: widget.playerResponse?.data?.email ?? "",
    );

    try {
      final response = await ForgotPasswordController().forgotPassword(request);

      setState(() {
        isLoading = false;
      });

      if (response != null) {
        print("okkkkkkkkkkkkkkkkk");
        showDialog(
          context: context,
          builder: (context) {
            return TransferForgotPasswordWidget(
              playerResponse: widget.playerResponse,
            );
          },
        );
      }
    } catch (e, stackTrace) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Forgot password error: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void toggleMarker() {
    setState(() {
      isMarked = !isMarked;
    });
  }

  Future<void> transferAmount() async {
    setState(() {
      isLoading = true;
    });

    final request = TransferRequestModel(
      from: widget.playerResponse?.data?.id.toString(),
      to: playerIdController.text.trim(),
      chips: amountController.text.trim(),
      password: passwordController.text,
    );

    try {
      final response = await transferController.amountTransfer(request);

      setState(() {
        isLoading = false;
      });

      if (response?.status == "OK") {
        Navigator.pop(context);
        // Show success message or update UI
        print("Transfer successful: ${response?.data?.balance}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: CupertinoColors.activeGreen,
            content: Text(
              "Success!: ${response?.status}, ID: ${response?.data?.balance ?? "N/A"}",
            ),
          ),
        );
      } else {
        final errorMessage = response?.messages?["from"] ??
            response?.messages?["error"] ??
            "Transfer failed";
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Transfer Failed"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Transfer API error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<TransferButtonProvider>(context);
    return GestureDetector(
      // onTap: () {
      //   provider.setClick(true);
      //   showDialog(
      //     barrierDismissible: true,
      //     context: context,
      //     builder: (BuildContext context) {
      //       bool isMarked = false; // Local state for dialog
      //
      //       return StatefulBuilder(
      //         builder: (context, setState) {
      //           return Padding(
      //             padding: const EdgeInsets.only(top: 50),
      //             child: Dialog(
      //               alignment: Alignment.topCenter,
      //               backgroundColor: Colors.transparent,
      //               child: SizedBox(
      //                 width: MediaQuery.sizeOf(context).width / 1,
      //                 height: MediaQuery.sizeOf(context).height / 2,
      //                 child: Stack(
      //                   alignment: Alignment.center,
      //                   children: [
      //                     Image.asset(
      //                       width: MediaQuery.sizeOf(context).width,
      //                       height: MediaQuery.sizeOf(context).height,
      //                       'assets/images/transfer (2)/bank frame (3).png',
      //                       fit: BoxFit.cover,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(top: 58, left: 10),
      //                       child: Column(
      //                         children: [
      //                           Row(
      //                             children: [
      //                               Column(
      //                                 children: [
      //                                   const CustomTransferTextField(
      //                                       hintText: "Transfer Player ID:"),
      //                                   const CustomTransferTextField(
      //                                       hintText: "Transfer to Amount\$:"),
      //                                   const CustomTransferTextField(
      //                                     hintText: "Password",
      //                                     keyboardType: TextInputType.text,
      //                                   ),
      //                                   isLoading
      //                                       ? const CircularProgressIndicator()
      //                                       : GestureDetector(
      //                                           onTap: () {
      //                                             forgotPassword();
      //                                             // showDialog(
      //                                             //   context: context,
      //                                             //   builder: (context) {
      //                                             //     return TransferForgotPasswordWidget(
      //                                             //       playerResponse:
      //                                             //           widget.playerResponse,
      //                                             //     );
      //                                             //   },
      //                                             // );
      //                                           },
      //                                           child: const BuildTextWidget(
      //                                             text: "Forgot Password",
      //                                             color: Colors.white,
      //                                             fontSize: 13,
      //                                           ),
      //                                         ),
      //                                   Row(
      //                                     children: [
      //                                       GestureDetector(
      //                                         onTap: () {
      //                                           setState(() {
      //                                             isMarked = !isMarked;
      //                                           });
      //                                         },
      //                                         child: Image.asset(
      //                                           width: MediaQuery.of(context)
      //                                                   .size
      //                                                   .width /
      //                                               24,
      //                                           isMarked
      //                                               ? "assets/images/CASHIER Button/TRANSFER/black check.png"
      //                                               : "assets/images/CASHIER Button/TRANSFER/black check emty.png",
      //                                         ),
      //                                       ),
      //                                       const BuildTextWidget(
      //                                         text: "Remember Password",
      //                                         color: Colors.white,
      //                                         fontSize: 13,
      //                                       ),
      //                                     ],
      //                                   ),
      //                                   Image.asset(
      //                                     "assets/images/CASHIER Button/TRANSFER/transfer alert holder.png",
      //                                     width: MediaQuery.of(context)
      //                                             .size
      //                                             .width /
      //                                         2.4,
      //                                   )
      //                                 ],
      //                               ),
      //                               Image.asset(
      //                                   width:
      //                                       MediaQuery.of(context).size.width /
      //                                           2.4,
      //                                   "assets/images/transfer (2)/avatar frame (4).png"),
      //                             ],
      //                           ),
      //                           Row(
      //                             children: [
      //                               GestureDetector(
      //                                 onTap: () {
      //                                   showDialog(
      //                                     context: context,
      //                                     builder: (context) {
      //                                       return const TransferHistoryWidget();
      //                                     },
      //                                   );
      //                                 },
      //                                 child: Image.asset(
      //                                   "assets/images/CASHIER Button/TRANSFER/history button.png",
      //                                   width:
      //                                       MediaQuery.of(context).size.width /
      //                                           2.4,
      //                                 ),
      //                               ),
      //                               GestureDetector(
      //                                 onTap: () {
      //                                   Navigator.pop(context);
      //                                   provider.setClick(false);
      //                                 },
      //                                 child: Image.asset(
      //                                   "assets/images/CASHIER Button/TRANSFER/transfer button.png",
      //                                   width:
      //                                       MediaQuery.of(context).size.width /
      //                                           2.4,
      //                                 ),
      //                               )
      //                             ],
      //                           )
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   );
      // },
      onTap: () {
        final provider =
            Provider.of<TransferButtonProvider>(context, listen: false);

        provider.setClick(true); // Make button active

        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            bool isMarked = false;

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
                                        CustomTransferTextField(
                                            controller: playerIdController,
                                            hintText: "Transfer Player ID:"),
                                        CustomTransferTextField(
                                            controller: amountController,
                                            hintText: "Transfer to Amount\$:"),
                                        CustomTransferTextField(
                                          controller: passwordController,
                                          hintText: "Password",
                                          keyboardType: TextInputType.text,
                                        ),
                                        isLoading
                                            ? const CircularProgressIndicator()
                                            : GestureDetector(
                                                onTap: () {
                                                  forgotPassword();
                                                },
                                                child: const BuildTextWidget(
                                                  text: "Forgot Password",
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
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
                                        // Navigator.pop(context);
                                        transferAmount();
                                        // provider.setClick(false);
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
        ).then((_) {
          provider.setClick(false);
        });
      },
      child: BuildButtonImageWidget(
        imgPath: provider.isClicked
            ? "assets/images/lobby/Transfer Button active.png"
            : "assets/images/lobby/transfer button passive.png",
      ),
    );
  }
}

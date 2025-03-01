import 'package:flutter/material.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:provider/provider.dart';

class DepositButtonWidget extends StatefulWidget {
  const DepositButtonWidget({super.key});

  @override
  State<DepositButtonWidget> createState() => _DepositButtonWidgetState();
}

class _DepositButtonWidgetState extends State<DepositButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<CashierButtonProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        provider.setClicked(false);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Dialog(
                alignment: Alignment.topCenter,
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  // height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      Image.asset(
                        width: width,
                        'assets/images/CASHIER Button/DEPOSIT/bank  frame.png',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Stack(
                                              children: [
                                                Image.asset(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        2.3,
                                                    "assets/images/CASHIER Button/DEPOSIT/currency holder long.png"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, top: 25),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width /
                                                                  5,
                                                          "assets/images/CASHIER Button/DEPOSIT/usdc long.png"),
                                                      Image.asset(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width /
                                                                  5,
                                                          "assets/images/CASHIER Button/DEPOSIT/usdt long.png")
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Stack(
                                              children: [
                                                Image.asset(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        2.3,
                                                    "assets/images/CASHIER Button/DEPOSIT/network holder long.png"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, top: 25),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width /
                                                                  2.6,
                                                          "assets/images/CASHIER Button/DEPOSIT/erc20 long.png"),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                4,
                                            "assets/images/CASHIER Button/DEPOSIT/qr frame.png"),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 39),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.4,
                                              "assets/images/CASHIER Button/DEPOSIT/instruction frame.png"),
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          3.7,
                                                  "assets/images/CASHIER Button/DEPOSIT/deposit holder 84.png"),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 20),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        3,
                                                child: const Text(
                                                  "Fds133kjdf3kkdf389fjsdflkASDF ",
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.white,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.8,
                                              "assets/images/CASHIER Button/DEPOSIT/withdraw black button.png"),
                                        ),
                                        Image.asset(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                3.2,
                                            "assets/images/cashier/deposit/Deposit button.png")
                                      ],
                                    ),
                                    // Stack(
                                    //   alignment: Alignment.center,
                                    //   children: [
                                    //     Image.asset(
                                    //         width: MediaQuery.sizeOf(context)
                                    //                 .width /
                                    //             2.7,
                                    //         "assets/images/cashier/withdraw/withdraw amount-password.png"),
                                    //     SizedBox(
                                    //       width:
                                    //           MediaQuery.sizeOf(context).width /
                                    //               3.5,
                                    //       child: const TextField(
                                    //         keyboardType: TextInputType.number,
                                    //         style: TextStyle(
                                    //           fontSize: 12,
                                    //           color: Colors.white,
                                    //         ),
                                    //         textAlign: TextAlign.center,
                                    //         decoration:
                                    //             InputDecoration.collapsed(
                                    //           hintText: "Deposit Amount:",
                                    //           hintStyle: TextStyle(
                                    //               color: Colors.white),
                                    //         ),
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    // const SizedBox(
                                    //   height: 8,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
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
      child: Image.asset(
          width: MediaQuery.sizeOf(context).width / 2.7,
          "assets/images/CASHIER Button/WITHDRAWAL/deposit button black.png"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:pokerpad/widget/withdraw_button_widget.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 50),
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
                height: height / 2,
                'assets/images/cashier/deposit image/bank  frame (1).png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2,
                                            "assets/images/cashier/deposit image/currency-network frame.png"),
                                        Positioned(
                                            left: 12,
                                            top: 29,
                                            child: Image.asset(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        2.2,
                                                "assets/images/cashier/deposit image/usdc.png")),
                                        Positioned(
                                            left: 12,
                                            top: height / 11,
                                            child: Image.asset(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        2.2,
                                                "assets/images/cashier/deposit image/solana.png")),
                                      ],
                                    ),
                                    // const SizedBox(
                                    //   height: 8,
                                    // ),
                                    Stack(
                                      children: [
                                        Image.asset(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2,
                                            "assets/images/cashier/deposit image/info frame.png"),
                                        Positioned(
                                          left: 20,
                                          top: 20,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        2.1,
                                                child: const Text(
                                                  "Step 1: Obtain the receival address by scanning the QR code with your phone.",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        2.1,
                                                child: const Text(
                                                  "Step 2: Send USDC SPL tokens,the designated USDC tokens on Solana.",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                    // const SizedBox(
                                    //   height: 8,
                                    // ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                3,
                                        "assets/images/cashier/deposit image/qr frame.png"),
                                    Stack(
                                      children: [
                                        Image.asset(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                3,
                                            "assets/images/CASHIER Button/DEPOSIT/deposit holder 84.png"),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 20),
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3.3,
                                          child: const Text(
                                            "Fds133kjdf3kkdf389fjsdflkASDFFds133kjdf3kkdf389fjsdflkASDF ",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                //navigate to withdraw page
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return const WithdrawButtonWidget();
                                      },
                                    );
                                  },
                                  child: Image.asset(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.4,
                                      "assets/images/CASHIER Button/DEPOSIT/withdraw black button.png"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    provider.setClicked(false);
                                  },
                                  child: Image.asset(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.6,
                                      "assets/images/cashier/deposit/Deposit button.png"),
                                )
                              ],
                            ),
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
  }
}

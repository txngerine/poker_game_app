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
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/cashier/withdraw/deposit frame.png',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2.7,
                                            "assets/images/cashier/withdraw/select currcnecy.png"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 40),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          6,
                                                  "assets/images/cashier/withdraw/usdc button.png"),
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          6,
                                                  "assets/images/cashier/withdraw/usdt button.png")
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2.7,
                                            "assets/images/cashier/withdraw/select network.png"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 40),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          6,
                                                  "assets/images/cashier/withdraw/erc20 button.png"),
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          6,
                                                  "assets/images/cashier/withdraw/trc20 button.png")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2.7,
                                            "assets/images/cashier/withdraw/withdraw amount-password.png"),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3.5,
                                          child: const TextField(
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "Deposit Amount:",
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.7,
                                        "assets/images/cashier/deposit/Alert placeholder.png"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2.7,
                                          "assets/images/cashier/withdraw/cancel button.png"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.7,
                                        "assets/images/cashier/deposit/qr code frame.png"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Stack(
                                      children: [
                                        Image.asset(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2.5,
                                            "assets/images/cashier/withdraw/Revceival code.png"),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 35),
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3,
                                          child: const Text(
                                            "Fds133kjdf3kkdf389fjsdflkASDF fdkljkj345",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.7,
                                        "assets/images/cashier/deposit/Deposit button.png")
                                  ],
                                )
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
          width: MediaQuery.sizeOf(context).width / 3,
          "assets/images/cashier/deposit button.png"),
    );
  }
}

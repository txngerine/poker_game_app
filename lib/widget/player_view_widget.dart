import 'package:flutter/material.dart';

class PlayerViewWidget extends StatefulWidget {
  const PlayerViewWidget({super.key});

  @override
  State<PlayerViewWidget> createState() => _PlayerViewWidgetState();
}

class _PlayerViewWidgetState extends State<PlayerViewWidget> {
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
          // height: MediaQuery.sizeOf(context).height / 2,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Image.asset(
                width: width,
                height: height,
                'assets/images/playerAffiliate/affiliate_bg.png',
                fit: BoxFit.none,
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

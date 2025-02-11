import 'package:flutter/material.dart';
import 'package:pokerpad/widget/custom_text_field_widget.dart';

class AffiliateBalanceSection extends StatefulWidget {
  const AffiliateBalanceSection({super.key});

  @override
  State<AffiliateBalanceSection> createState() =>
      _AffiliateBalanceSectionState();
}

class _AffiliateBalanceSectionState extends State<AffiliateBalanceSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(
            width: width / 2,
            "assets/images/Affiliate/balance place holder.png"),
        Positioned(
          left: width / 3,
          bottom: height / 14,
          child: Text(
            "\$36,2948",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          left: width / 20,
          top: height / 17,
          child: Row(
            children: [
              Image.asset(
                "assets/images/Affiliate/Aff Deposit Button.png",
                width: width / 5,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Dialog(
                          alignment: Alignment.topCenter,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height / 2,
                            width: MediaQuery.sizeOf(context).width,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/cashier/withdraw/deposit frame.png',
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
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
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6,
                                                        "assets/images/cashier/withdraw/usdc button.png"),
                                                    Image.asset(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6,
                                                        "assets/images/cashier/withdraw/usdt button.png")
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.5,
                                              "assets/images/cashier/withdraw/scan qr code.png")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
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
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6,
                                                        "assets/images/cashier/withdraw/erc20 button.png"),
                                                    Image.asset(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6,
                                                        "assets/images/cashier/withdraw/trc20 button.png")
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          2.5,
                                                  "assets/images/cashier/withdraw/Revceival code.png"),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 35),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        3,
                                                child: Text(
                                                  "Fds133kjdf3kkdf389fjsdflkASDF fdkljkj345",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Column(
                                            children: [
                                              CustomTextFieldWidget(
                                                  hintText: "Withdraw Amount"),
                                              CustomTextFieldWidget(
                                                  hintText: "Password"),
                                            ],
                                          ),
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.5,
                                              "assets/images/cashier/withdraw/alert placeholder.png")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3,
                                              "assets/images/cashier/withdraw/forgot password.png"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        2.7,
                                                "assets/images/cashier/withdraw/cancel button.png"),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.7,
                                              "assets/images/cashier/withdraw/withdraw button.png")
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
                child: Image.asset(
                  "assets/images/Affiliate/Aff withdraw button.png",
                  width: width / 5,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

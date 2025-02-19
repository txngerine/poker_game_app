import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:pokerpad/view/qr_scan_page.dart';
import 'package:provider/provider.dart';

class WithdrawButtonWidget extends StatefulWidget {
  const WithdrawButtonWidget({
    super.key,
  });

  @override
  State<WithdrawButtonWidget> createState() => _WithdrawButtonWidgetState();
}

class _WithdrawButtonWidgetState extends State<WithdrawButtonWidget> {
  String scannedCode = ""; // Store scanned QR code
  final MobileScannerController controller = MobileScannerController();

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
                                Stack(
                                  children: [
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.7,
                                        "assets/images/cashier/withdraw/select currcnecy.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 40),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  6,
                                              "assets/images/cashier/withdraw/usdc button.png"),
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  6,
                                              "assets/images/cashier/withdraw/usdt button.png")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("clicked");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const QrScanPage(),
                                        ));
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return Dialog(
                                    //       child: SizedBox(
                                    //         height: height / 2,
                                    //         width: width,
                                    //         child: MobileScanner(
                                    //           controller: controller,
                                    //           onDetect: (capture) {
                                    //             final barcode =
                                    //                 capture.barcodes.first;
                                    //             controller.dispose();
                                    //             Navigator.pop(
                                    //                 context, barcode.rawValue);
                                    //             print(
                                    //                 "00000000000000000000000000000000000000000000000000000000000000000");
                                    //             print(
                                    //                 "barcode values${barcode.rawValue}");
                                    //           },
                                    //         ),
                                    //       ),
                                    //     );
                                    //   },
                                    // );
                                  },
                                  child: Image.asset(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.5,
                                      "assets/images/cashier/withdraw/scan qr code.png"),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.7,
                                        "assets/images/cashier/withdraw/select network.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 40),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  6,
                                              "assets/images/cashier/withdraw/erc20 button.png"),
                                          Image.asset(
                                              width: MediaQuery.sizeOf(context)
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
                                            MediaQuery.sizeOf(context).width /
                                                2.5,
                                        "assets/images/cashier/withdraw/Revceival code.png"),
                                    Container(
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 35),
                                      width:
                                          MediaQuery.sizeOf(context).width / 3,
                                      child: const Text(
                                        "",
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
                                Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        // Background Image
                                        Image.asset(
                                          "assets/images/cashier/withdraw/withdraw amount-password.png",
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2.7,
                                          fit: BoxFit.cover,
                                        ),

                                        // TextField without border
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15), // Adjust as needed
                                          child: SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                3.5, // To fit inside the image
                                            child: const TextField(
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                hintText: "Withdraw Amount",
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                      ],
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
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Image.asset(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.5,
                                    "assets/images/cashier/withdraw/alert placeholder.png")
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                    width: MediaQuery.sizeOf(context).width / 3,
                                    "assets/images/cashier/withdraw/forgot password.png"),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.7,
                                      "assets/images/cashier/withdraw/cancel button.png"),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.7,
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
          width: MediaQuery.sizeOf(context).width / 3,
          "assets/images/cashier/withdraw button.png"),
    );
  }
}

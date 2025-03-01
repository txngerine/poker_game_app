import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:pokerpad/provider/currency_button_provider.dart';
import 'package:pokerpad/provider/qr_provider.dart';
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
  int selectedButton = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<CashierButtonProvider>(context);
    final qrProvider = Provider.of<QrProvider>(context);
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
                        'assets/images/CASHIER Button/WITHDRAWAL/bank  frame.png',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 50),
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
                                                2.9,
                                        "assets/images/CASHIER Button/WITHDRAWAL/currency holder.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 30),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<
                                                      CurrencyButtonProvider>()
                                                  .selectButton(1);
                                            },
                                            child: Consumer<
                                                CurrencyButtonProvider>(
                                              builder:
                                                  (context, provider, child) {
                                                return provider
                                                            .selectedButton ==
                                                        1
                                                    ? Image.asset(
                                                        "assets/images/CASHIER Button/WITHDRAWAL/selected_usdc.png",
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6.1,
                                                      )
                                                    : Image.asset(
                                                        "assets/images/CASHIER Button/WITHDRAWAL/usdc button.png",
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6.1,
                                                      );
                                              },
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<
                                                      CurrencyButtonProvider>()
                                                  .selectButton(
                                                      2); // Update the selected button using the provider
                                            },
                                            child: Consumer<
                                                CurrencyButtonProvider>(
                                              builder:
                                                  (context, provider, child) {
                                                return provider
                                                            .selectedButton ==
                                                        2
                                                    ? Image.asset(
                                                        "assets/images/CASHIER Button/WITHDRAWAL/selected_usdt.png",
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6.1,
                                                      )
                                                    : Image.asset(
                                                        "assets/images/CASHIER Button/WITHDRAWAL/usdt button.png",
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width /
                                                                6.1,
                                                      );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                        width: width / 2.9,
                                        "assets/images/CASHIER Button/WITHDRAWAL/receival address holder.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 23, left: 16),
                                      child: GestureDetector(
                                        onTap: () async {
                                          final scannedValue =
                                              await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const QrScanPage(),
                                            ),
                                          );

                                          if (scannedValue != null) {
                                            setState(() {
                                              scannedCode =
                                                  scannedValue; // Update state with scanned value
                                            });
                                          }
                                        },
                                        child: Image.asset(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3.5,
                                          "assets/images/cashier/withdraw/scan qr code.png",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     print("clicked");
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) =>
                                //               const QrScanPage(),
                                //         ));
                                //   },
                                //   child: Image.asset(
                                //       width: MediaQuery.sizeOf(context).width /
                                //           2.5,
                                //       "assets/images/cashier/withdraw/scan qr code.png"),
                                // )
                              ],
                            ),
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.9,
                                        "assets/images/CASHIER Button/WITHDRAWAL/network holder.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 30),
                                      child: Image.asset(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3.3,
                                          "assets/images/CASHIER Button/WITHDRAWAL/erc20 button.png"),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.9,
                                        "assets/images/CASHIER Button/WITHDRAWAL/receival address holder.png"),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 35),
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                3,
                                        child: Consumer<QrProvider>(
                                          builder:
                                              (context, qrProvider, child) {
                                            return Text(
                                              qrProvider.scannedCode,
                                              style: const TextStyle(
                                                fontSize: 8,
                                                color: Colors.white,
                                                overflow: TextOverflow.clip,
                                              ),
                                            );
                                          },
                                        ))
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        // Background Image
                                        Image.asset(
                                          "assets/images/cashier/withdraw/withdraw amount-password.png",
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2.9,
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
                                                hintText: "Deposit Amount\$",
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
                                      children: [
                                        // Background Image
                                        Image.asset(
                                          "assets/images/cashier/withdraw/withdraw amount-password.png",
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2.9,
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
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(
                                    width: MediaQuery.sizeOf(context).width / 3,
                                    "assets/images/CASHIER Button/WITHDRAWAL/withdraw alert holder.png")
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.9,
                                      "assets/images/CASHIER Button/WITHDRAWAL/deposit button black.png"),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.9,
                                    "assets/images/cashier/withdraw/withdraw button.png")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
          "assets/images/cashier/withdraw button.png"),
    );
  }
}

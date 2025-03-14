import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Dialog(
        alignment: Alignment.topCenter,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 2,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Image.asset(
                width: width,
                height: height / 2,
                'assets/images/cashier/withdraw images/bank  frame (1).png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //left side column
                        Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.2,
                                    "assets/images/cashier/withdraw images/withdraw_currency-network frame.png"),
                                Positioned(
                                    left: 14,
                                    top: 29,
                                    child: Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.5,
                                        "assets/images/cashier/withdraw images/withdraw_usdc.png")),
                                Positioned(
                                    left: 14,
                                    top: height / 10,
                                    child: Image.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.5,
                                        "assets/images/cashier/withdraw images/withdraw_solana.png")),
                              ],
                            ),
                            Stack(
                              children: [
                                // Background Image
                                Image.asset(
                                  "assets/images/cashier/withdraw/withdraw amount-password.png",
                                  width: MediaQuery.sizeOf(context).width / 2.2,
                                  fit: BoxFit.cover,
                                ),

                                // TextField without border
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 49,
                                      vertical: 23), // Adjust as needed
                                  child: SizedBox(
                                    width: MediaQuery.sizeOf(context).width /
                                        3.5, // To fit inside the image
                                    child: const TextField(
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Withdraw Amount: \$",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      keyboardType: TextInputType.number,
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
                                  width: MediaQuery.sizeOf(context).width / 2.2,
                                  fit: BoxFit.cover,
                                ),

                                // TextField without border
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 49,
                                      vertical: 23), // Adjust as needed
                                  child: SizedBox(
                                    width: MediaQuery.sizeOf(context).width /
                                        3.5, // To fit inside the image
                                    child: const TextField(
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Forgot Password?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                  width: MediaQuery.sizeOf(context).width / 2.3,
                                  "assets/images/cashier/withdraw images/deposit button black.png"),
                            ),
                          ],
                        ),
                        //right side column
                        Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                    width: width / 2.6,
                                    "assets/images/cashier/withdraw images/receival address holder.png"),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 29, left: 30),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final scannedValue = await Navigator.push(
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
                                      width: MediaQuery.sizeOf(context).width /
                                          3.5,
                                      "assets/images/cashier/withdraw/scan qr code.png",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.6,
                                    "assets/images/cashier/withdraw images/receival address code holder.png"),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 15),
                                    width: MediaQuery.sizeOf(context).width / 3,
                                    child: Consumer<QrProvider>(
                                      builder: (context, qrProvider, child) {
                                        return Text(
                                          qrProvider.scannedCode,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            overflow: TextOverflow.clip,
                                          ),
                                        );
                                      },
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                                width: MediaQuery.sizeOf(context).width / 2.6,
                                "assets/images/cashier/withdraw images/withdraw alert holder.png"),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                provider.setClicked(false);
                              },
                              child: Image.asset(
                                  width: MediaQuery.sizeOf(context).width / 2.6,
                                  "assets/images/cashier/withdraw images/withdraw button white.png"),
                            )
                          ],
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
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
  }
}

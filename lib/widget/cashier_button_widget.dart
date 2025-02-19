import 'package:flutter/material.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:pokerpad/widget/deposit_button_widget.dart';
import 'package:pokerpad/widget/withdraw_button_widget.dart';
import 'package:provider/provider.dart';

import 'build_button_image_widget.dart';

class CashierButtonWidget extends StatefulWidget {
  const CashierButtonWidget({super.key});

  @override
  State<CashierButtonWidget> createState() => _CashierButtonWidgetState();
}

class _CashierButtonWidgetState extends State<CashierButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<CashierButtonProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.setClicked(true);
        showDialog(
          context: context,
          barrierDismissible: false, // Dismiss by tapping outside
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Dialog(
                alignment: Alignment.topCenter,
                backgroundColor: Colors.transparent, // Transparent background
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1,
                  height: MediaQuery.sizeOf(context).height / 3,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        'assets/images/cashier/cashier frame.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: width / 14,
                        bottom: height / 48,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                width: MediaQuery.sizeOf(context).width / 1.4,
                                "assets/images/cashier/contact affiliate button.png"),
                            const SizedBox(
                              height: 40,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WithdrawButtonWidget(),
                                DepositButtonWidget()
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: BuildButtonImageWidget(
        imgPath: provider.isClicked
            ? "assets/images/lobby/Cashier Button active.png"
            : "assets/images/lobby/cashier button passive.png",
      ),
    );
  }
}

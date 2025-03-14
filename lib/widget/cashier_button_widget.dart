import 'package:flutter/material.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:pokerpad/widget/deposit_button_widget.dart';
import 'package:provider/provider.dart';

import 'build_button_image_widget.dart';

class CashierButtonWidget extends StatefulWidget {
  const CashierButtonWidget({super.key});

  @override
  State<CashierButtonWidget> createState() => _CashierButtonWidgetState();
}

class _CashierButtonWidgetState extends State<CashierButtonWidget> {
  String scannedCode = "";
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
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const DepositButtonWidget();
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

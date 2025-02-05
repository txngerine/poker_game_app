import 'package:flutter/material.dart';
import 'package:pokerpad/provider/transfer_button_provider.dart';
import 'package:provider/provider.dart';

import 'build_button_image_widget.dart';

class TransferButtonWidget extends StatefulWidget {
  const TransferButtonWidget({super.key});

  @override
  State<TransferButtonWidget> createState() => _TransferButtonWidgetState();
}

class _TransferButtonWidgetState extends State<TransferButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransferButtonProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.setClick(true);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: const Text("Transfer Info",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: const Text(
                  "This is the transfer button. Here you can manage your affiliate details."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    provider.setClick(false);
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
      child: BuildButtonImageWidget(
        imgPath: provider.isClicked
            ? "assets/images/lobby/Transfer Button active.png"
            : "assets/images/lobby/transfer button passive.png",
      ),
    );
  }
}

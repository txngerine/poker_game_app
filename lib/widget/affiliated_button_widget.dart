import 'package:flutter/material.dart';
import 'package:pokerpad/provider/affiliated_button_provider.dart';
import 'package:pokerpad/widget/affiliate_button_view_widget.dart';
import 'package:provider/provider.dart';

import 'build_button_image_widget.dart';

class AffiliatedButtonWidget extends StatelessWidget {
  const AffiliatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AffiliatedButtonProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.setClicked(true);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AffiliateButtonViewWidget();
            AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: const Text("Affiliate Info",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: const Text(
                  "This is the affiliate button. Here you can manage your affiliate details."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    provider.setClicked(false);
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
      child: BuildButtonImageWidget(
        imgPath: "assets/images/lobby/affiliate button passive.png",
      ),
    );
  }
}

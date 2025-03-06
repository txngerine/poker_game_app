import 'package:flutter/material.dart';
import 'package:pokerpad/provider/affiliated_button_provider.dart';
import 'package:provider/provider.dart';

import 'affiliate_player_view_widget.dart';
import 'build_button_image_widget.dart';

class AffiliatedButtonWidget extends StatelessWidget {
  const AffiliatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AffiliatedButtonProvider>(context);
    return GestureDetector(
      onTap: () {
        // provider.setClicked(true);
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return const AffiliateButtonViewWidget();
        //   },
        // );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AffiliatePlayerViewWidget();
          },
        );
      },
      child: const BuildButtonImageWidget(
        imgPath: "assets/images/lobby/affiliate button passive.png",
      ),
    );
  }
}

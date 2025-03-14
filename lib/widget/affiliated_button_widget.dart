import 'package:flutter/material.dart';
import 'package:pokerpad/provider/affiliated_button_provider.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import 'affiliate_players_button_widget.dart';
import 'build_button_image_widget.dart';

class AffiliatedButtonWidget extends StatelessWidget {
  final LoginResponseModel? playerResponse;
  const AffiliatedButtonWidget({super.key, this.playerResponse});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AffiliatedButtonProvider>(context);
    bool isAffiliate = playerResponse?.data?.selfAffiliateId != null &&
        playerResponse!.data!.selfAffiliateId! > 0;

    return GestureDetector(
      onTap: () {
        provider.setClicked(true);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return const AffiliatePlayersButtonWidget();
          },
        );
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     // affiliate player view function
        //     return isAffiliate
        //         ? AffiliateButtonViewWidget()
        //         : AffiliatePlayerViewWidget();
        //   },
        // );
      },
      child: BuildButtonImageWidget(
        imgPath: provider.isClicked
            ? "assets/images/lobby/Affiliate button active.png"
            : "assets/images/lobby/affiliate button passive.png",
      ),
    );
  }
}

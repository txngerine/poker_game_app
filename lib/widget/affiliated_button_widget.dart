import 'package:flutter/material.dart';
import 'package:pokerpad/provider/affiliated_button_provider.dart';
import 'package:pokerpad/widget/affiliate_button_view_widget.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import 'affiliate_player_view_widget.dart';
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
            // affiliate player view function
            return isAffiliate
                ? AffiliateButtonViewWidget()
                : AffiliatePlayerViewWidget();
          },
        );
      },
      child: const BuildButtonImageWidget(
        imgPath: "assets/images/lobby/affiliate button passive.png",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokerpad/provider/affiliated_button_provider.dart';
import 'package:pokerpad/widget/affiliate_player_profile_view.dart';
import 'package:pokerpad/widget/affiliate_players_button_widget.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import 'build_button_image_widget.dart';

class AffiliatedButtonWidget extends StatelessWidget {
  final LoginResponseModel? playerResponse;
  const AffiliatedButtonWidget({super.key, this.playerResponse});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AffiliatedButtonProvider>(context);
    String? userType = playerResponse?.data!.usertype;

    return GestureDetector(
      onTap: () {
        provider.setClicked(true);
        // showDialog(
        //   barrierDismissible: false,
        //   context: context,
        //   builder: (BuildContext context) {
        //     return const AffiliatePlayersButtonWidget();
        //   },
        // );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // affiliate player view function
            return userType == "AFFILIATE"
                ? AffiliatePlayersButtonWidget(
                    playerResponse: playerResponse,
                  )
                : AffiliatePlayerProfileView(
                    playerResponse: playerResponse,
                  );
          },
        ).then((_) {
          provider.setClicked(false);
        });
      },
      child: BuildButtonImageWidget(
        imgPath: provider.isClicked
            ? "assets/images/lobby/Affiliate button active.png"
            : "assets/images/lobby/affiliate button passive.png",
      ),
    );
  }
}

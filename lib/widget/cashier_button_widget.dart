import 'package:flutter/material.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:pokerpad/view/kyc_info_popUp.dart';
import 'package:pokerpad/widget/deposit_button_widget.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import 'build_button_image_widget.dart';

class CashierButtonWidget extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const CashierButtonWidget({super.key, this.playerResponse});

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
    print("kyc id:${widget.playerResponse?.data?.kyc?.idStatus}");
    print("kyc face:${widget.playerResponse?.data?.kyc?.faceStatus}");
    return GestureDetector(
      onTap: () {
        final kyc = widget.playerResponse?.data?.kyc;
        final idRejected = kyc?.idStatus?.toLowerCase() == 'rejected';
        final faceRejected = kyc?.faceStatus?.toLowerCase() == 'rejected';
        provider.setClicked(true);
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setDialogState) {
                if (idRejected || faceRejected) {
                  return const KycInfoPopup();
                } else {
                  return DepositButtonWidget(
                    playerResponse: widget.playerResponse,
                  );
                }
              },
            );

            DepositButtonWidget(
              playerResponse: widget.playerResponse,
            );
          },
        ).then((_) {
          provider.setClicked(false);
        });
      },
      child: BuildButtonImageWidget(
        imgPath: provider.isClicked
            ? "assets/images/lobby/Cashier Button active.png"
            : "assets/images/lobby/cashier button passive.png",
      ),
    );
  }
}

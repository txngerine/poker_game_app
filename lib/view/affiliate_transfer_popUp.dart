import 'package:flutter/material.dart';
import 'package:pokerpad/view/affiliate_transfer_history_popUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/build_text_widget.dart';
import '../widget/custom_transfer_text_field.dart';

class AffiliateTransferPopup extends StatefulWidget {
  const AffiliateTransferPopup({super.key});

  @override
  State<AffiliateTransferPopup> createState() => _AffiliateTransferPopupState();
}

class _AffiliateTransferPopupState extends State<AffiliateTransferPopup> {
  bool isMarked = false;
  bool isLoading = false;
  bool isTransferLoading = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController playerIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Dialog(
        alignment: Alignment.topCenter,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: width,
          height: height / 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                width: width,
                height: height,
                'assets/images/transfer (2)/bank frame (3).png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58, left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            CustomTransferTextField(
                                controller: playerIdController,
                                hintText: "Transfer Player ID:"),
                            CustomTransferTextField(
                                controller: amountController,
                                hintText: "Transfer to Amount\$:"),
                            CustomTransferTextField(
                              controller: passwordController,
                              hintText: "Password",
                              keyboardType: TextInputType.text,
                            ),
                            isLoading
                                ? const CircularProgressIndicator()
                                : GestureDetector(
                                    // onTap: () => forgotPassword(),
                                    child: const BuildTextWidget(
                                      text: "Forgot Password",
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    // setDialogState(() {
                                    //   isMarked = !isMarked;
                                    // });
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    if (!isMarked) {
                                      await prefs.remove('remembered_password');
                                    }
                                  },
                                  child: Image.asset(
                                    width: width / 24,
                                    isMarked
                                        ? "assets/images/CASHIER Button/TRANSFER/black check.png"
                                        : "assets/images/CASHIER Button/TRANSFER/black check emty.png",
                                  ),
                                ),
                                const BuildTextWidget(
                                  text: "Remember Password",
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ],
                            ),
                            Container(
                              width: width / 2.4,
                              height: height / 12,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/CASHIER Button/TRANSFER/transfer alert holder.png"),
                                ),
                              ),
                              child: isTransferLoading
                                  ? const Center(
                                      child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator()))
                                  : (errorMessage != null &&
                                          errorMessage!.isNotEmpty)
                                      ? Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: BuildTextWidget(
                                              text: errorMessage!,
                                              align: TextAlign.center,
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      : null,
                            ),
                          ],
                        ),
                        Image.asset(
                          width: width / 2.4,
                          "assets/images/transfer (2)/avatar frame (4).png",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  AffiliateTransferHistoryPopup(),
                            );
                          },
                          child: Image.asset(
                            "assets/images/CASHIER Button/TRANSFER/history button.png",
                            width: width / 2.4,
                          ),
                        ),
                        GestureDetector(
                          // onTap: () =>
                          //     transferAmount(setDialogState),
                          child: Image.asset(
                            "assets/images/CASHIER Button/TRANSFER/transfer button.png",
                            width: width / 2.4,
                          ),
                        )
                      ],
                    )
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

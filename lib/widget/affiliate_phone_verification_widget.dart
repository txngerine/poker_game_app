import 'package:flutter/material.dart';
import 'package:pokerpad/widget/affiliate_text_field_widget.dart';

class AffiliatePhoneVerificationWidget extends StatefulWidget {
  const AffiliatePhoneVerificationWidget({super.key});

  @override
  State<AffiliatePhoneVerificationWidget> createState() =>
      _AffiliatePhoneVerificationWidgetState();
}

class _AffiliatePhoneVerificationWidgetState
    extends State<AffiliatePhoneVerificationWidget> {
  List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                        "assets/images/Affiliate/verify phone alert/verify phone background.png"),
                    Padding(
                      padding: EdgeInsets.only(top: height / 7),
                      child: Column(
                        children: [
                          const AffiliateTextFieldWidget(
                            hintText: "your phone number",
                          ),
                          Image.asset(
                              width: width / 1.5,
                              "assets/images/Affiliate/verify phone alert/confirm phone button.png"),
                          SizedBox(
                            height: height / 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => SizedBox(
                                width: 50,
                                height: 50, // Adjust width as needed
                                child: TextFormField(
                                  controller: otpControllers[index],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  decoration: InputDecoration(
                                    counterText:
                                        "", // Hides the counter below TextFormField
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.white70),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index < 3) {
                                      FocusScope.of(context)
                                          .nextFocus(); // Auto-focus next field
                                    }
                                  },
                                ),
                              ),
                            )
                                .expand(
                                    (widget) => [widget, const SizedBox(width: 10)])
                                .toList(),
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Image.asset(
                              width: width / 2,
                              "assets/images/Affiliate/verify phone alert/resend code button (2).png"),
                          SizedBox(
                            height: height / 18,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                                width: width / 1.4,
                                "assets/images/Affiliate/verify phone alert/verify phone button.png"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Image.asset(
          width: width / 16,
          "assets/images/Affiliate/verify phone alert/edit icon.png"),
    );
  }
}

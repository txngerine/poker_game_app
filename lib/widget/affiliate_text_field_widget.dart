import 'package:flutter/material.dart';

class AffiliateTextFieldWidget extends StatefulWidget {
  final String? hintText;
  const AffiliateTextFieldWidget({super.key, this.hintText});

  @override
  State<AffiliateTextFieldWidget> createState() =>
      _AffiliateTextFieldWidgetState();
}

class _AffiliateTextFieldWidgetState extends State<AffiliateTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          width: MediaQuery.sizeOf(context).width / 1.5,
          "assets/images/Affiliate/verify phone alert/location text field.png",
        ),
        Positioned(
          top: 20,
          bottom: 10,
          left: 20, // Adjust position as needed
          right: 20, // Adjust width as needed
          child: Material(
            color: Colors.transparent,
            child: TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.white70,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomTransferTextField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  const CustomTransferTextField(
      {super.key, required this.hintText, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background Image
        Image.asset(
          "assets/images/cashier/withdraw/withdraw amount-password.png",
          width: MediaQuery.sizeOf(context).width / 2.9,
          fit: BoxFit.cover,
        ),

        // TextField without border
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15), // Adjust as needed
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width /
                3.5, // To fit inside the image
            child: TextField(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white),
              ),
              keyboardType: keyboardType ?? TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }
}

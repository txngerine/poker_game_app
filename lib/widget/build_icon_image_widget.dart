import 'package:flutter/material.dart';

class BuildIconImageWidget extends StatelessWidget {
  final String imgName;
  final VoidCallback? onTap;
  const BuildIconImageWidget({super.key, required this.imgName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imgName,
        width: MediaQuery.of(context).size.width / 9,
      ),
    );
  }
}

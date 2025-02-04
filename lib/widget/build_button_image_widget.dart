import 'package:flutter/material.dart';

class BuildButtonImageWidget extends StatelessWidget {
  final String imgPath;
  final VoidCallback? onTap;
  const BuildButtonImageWidget({super.key, required this.imgPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Image.asset(
          imgPath,
          width: MediaQuery.of(context).size.width / 3,
        ));
  }
}

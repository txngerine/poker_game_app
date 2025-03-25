// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokerpad/widget/chart_line_widget.dart';

import '../model/login_response_model.dart';
import '../view/lobby_avatar_view.dart';

class AvatarImageViewWidget extends StatefulWidget {
  final String? avatar;
  final LoginResponseModel? playerResponse;
  const AvatarImageViewWidget({super.key, this.avatar, this.playerResponse});

  @override
  State<AvatarImageViewWidget> createState() => _AvatarImageViewWidgetState();
}

class _AvatarImageViewWidgetState extends State<AvatarImageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2.1,
        height: MediaQuery.of(context).size.height / 2.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff3C3D37),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ChartLineWidget(
                        );
                      },
                    );
                  },
                  child: Image.network(
                    width: MediaQuery.of(context).size.width / 2.1,
                    height: MediaQuery.of(context).size.height / 2.7,

                    widget.avatar ?? "", // Use empty string if null
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/user_img.png", // Fallback image
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.playerResponse?.data?.nickname ?? "no name",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "ID ${widget.playerResponse?.data?.id ?? "no id"}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

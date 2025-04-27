import 'package:flutter/material.dart';
import 'package:pokerpad/provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import 'chart_line_widget.dart';

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
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        final avatarStatus = loginProvider.updateAvatar;
        final lobbyAvatarStatus = avatarStatus["lobby_avatar"];

        return Container(
          width: MediaQuery.of(context).size.width / 2.1,
          height: MediaQuery.of(context).size.height / 2.7,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff3C3D37),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
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
                        return const ChartLineWidget();
                      },
                    );
                  },
                  child:
                      lobbyAvatarStatus != null && lobbyAvatarStatus.isNotEmpty
                          ? Image.network(
                              '${lobbyAvatarStatus}?v=${DateTime.now().millisecondsSinceEpoch}', // cache-buster added
                              width: MediaQuery.of(context).size.width / 2.1,
                              height: MediaQuery.of(context).size.height / 2.7,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/images/user_img.png", // fallback image
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              "assets/images/user_img.png", // fallback if no avatar URL
                              width: MediaQuery.of(context).size.width / 2.1,
                              height: MediaQuery.of(context).size.height / 2.7,
                              fit: BoxFit.cover,
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
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "ID ${widget.playerResponse?.data?.id ?? "no id"}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

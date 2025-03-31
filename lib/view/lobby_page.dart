import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerpad/model/login_response_model.dart';
import 'package:pokerpad/view/game_view.dart';
import 'package:pokerpad/widget/affiliated_button_widget.dart';
import 'package:pokerpad/widget/avatar_image_view_widget.dart';
import 'package:pokerpad/widget/build_icon_image_widget.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/cashier_button_widget.dart';
import 'package:pokerpad/widget/chart_line_widget.dart';
import 'package:pokerpad/widget/info_button_widget.dart';
import 'package:pokerpad/widget/profile_button_widget.dart';
import 'package:pokerpad/widget/self_exclusion_widget.dart';
import 'package:pokerpad/widget/top_winners_view_widget.dart';
import 'package:pokerpad/widget/transfer_button_widget.dart';
import 'package:provider/provider.dart';

import '../constants/screen_size.dart';
import '../provider/login_provider.dart';

class LobbyPage extends StatefulWidget {
  final String? playerBalance;
  final String? avatar;
  final LoginResponseModel? playerResponse;
  const LobbyPage(
      {super.key, this.playerBalance, this.avatar, this.playerResponse});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  // String balance = "0.00";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    print(widget.playerResponse!.data?.nickname);
    print(widget.playerResponse!.data?.balance);
    print(widget.playerResponse);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: ScreenSize.screenHeight,
            width: ScreenSize.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/lobby/lobby pattern.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SelfExclusionWidget(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const ProfileButtonWidget();
                        },
                      );
                    },
                    child: const BuildIconImageWidget(
                        imgName:
                            "assets/images/lobby/profile button passive.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/lobby/balance holder.png",
                        width: MediaQuery.sizeOf(context).width / 2,
                      ),
                      Center(
                          child: BuildSubHeadingText(
                              text:
                                  "\$${loginProvider.playerBalance ?? widget.playerBalance}"))
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked info button");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const InfoButtonWidget();
                        },
                      );
                    },
                    child: const BuildIconImageWidget(
                        imgName: "assets/images/lobby/info button active.png"),
                  ),
                  const BuildIconImageWidget(
                      imgName: "assets/images/lobby/Logo active (1).png"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AffiliatedButtonWidget(
                    playerResponse: widget.playerResponse,
                  ),
                  const CashierButtonWidget(),
                  const TransferButtonWidget(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AvatarImageViewWidget(
                    playerResponse: widget.playerResponse,
                    avatar: widget.avatar,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const TopWinnersViewWidget()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Image.asset("assets/images/lobby/Table Header (1).png"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                          alignment: Alignment.center,
                          // height: MediaQuery.sizeOf(context).height / 15,
                          width: MediaQuery.of(context).size.width / 4,
                          "assets/images/lobby/holdem button active.png"),
                      Image.asset(
                          width: MediaQuery.of(context).size.width / 5,
                          "assets/images/lobby/omaha butoon passive.png"),
                      const Spacer(),
                      Image.asset(
                          width: MediaQuery.of(context).size.width / 2.3,
                          "assets/images/lobby/auto top up button  active.png"),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //         context,
                          //         PageTransition(
                          //             child: const GameView(),
                          //             type: PageTransitionType
                          //                 .leftToRightWithFade))
                          //     .then((_) {
                          //   SystemChrome.setEnabledSystemUIMode(
                          //       SystemUiMode.immersiveSticky);
                          // });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameView(
                                playerResponse: widget.playerResponse,
                                buttonId: 100,
                              ),
                            ),
                          ).then((_) {
                            SystemChrome.setEnabledSystemUIMode(
                                SystemUiMode.immersiveSticky);
                          });
                        },
                        child: Image.asset(
                          fit: BoxFit.fill,
                          "assets/images/lobby/100 jeton.png",
                          width: MediaQuery.sizeOf(context).width / 2,
                          height: MediaQuery.sizeOf(context).height / 5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameView(
                                  playerResponse: widget.playerResponse,
                                  buttonId: 200,
                                ),
                              ));
                        },
                        child: Image.asset(
                          "assets/images/lobby/200 jeton.png",
                          fit: BoxFit.fill,
                          width: MediaQuery.sizeOf(context).width / 2,
                          height: MediaQuery.sizeOf(context).height / 5,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/lobby/500 jeton.png",
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: MediaQuery.sizeOf(context).height / 5,
                        fit: BoxFit.fill,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("clicked");
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ChartLineWidget(
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          "assets/images/lobby/1000 jeton.png",
                          width: MediaQuery.sizeOf(context).width / 2,
                          height: MediaQuery.sizeOf(context).height / 5,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

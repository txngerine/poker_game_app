import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerpad/controller/rat_hole_controller.dart';
import 'package:pokerpad/model/login_response_model.dart';
import 'package:pokerpad/model/rat_hole_request_model.dart';
import 'package:pokerpad/model/rat_hole_response_model.dart';
import 'package:pokerpad/view/game_view.dart';
import 'package:pokerpad/widget/affiliated_button_widget.dart';
import 'package:pokerpad/widget/avatar_image_view_widget.dart';
import 'package:pokerpad/widget/build_button_image_widget.dart';
import 'package:pokerpad/widget/build_icon_image_widget.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/cashier_button_widget.dart';
import 'package:pokerpad/widget/info_button_widget.dart';
import 'package:pokerpad/widget/profile_button_widget.dart';
import 'package:pokerpad/widget/top_winners_view_widget.dart';
import 'package:pokerpad/widget/transfer_button_widget.dart';
import 'package:provider/provider.dart';

import '../constants/screen_size.dart';
import '../provider/login_provider.dart';
import '../widget/chat_support_widget.dart';

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

  bool isLoading = false;
  final RatHoleController ratHoleController = RatHoleController();
  Future<bool> ratHole(String buyIn) async {
    setState(() {
      isLoading = true;
    });
    try {
      RatHoleRequestModel request = RatHoleRequestModel(
          roomId: '16',
          playerId: widget.playerResponse!.data?.id,
          buyIn: buyIn);
      RatHoleResponseModel? response =
          await ratHoleController.checkRatHole(request);
      if (response?.status == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(response!.status ?? "okay")));

        print("rathole successfully");
        return true;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child:
                  Image.asset("assets/images/rathole/no retholing popup.png"),
            );
          },
        );
        return false;
      }
    } catch (e) {
      print("error$e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final balance = loginProvider.playerBalance;
    print(widget.playerResponse!.data?.id);
    print("playerBalance:${widget.playerResponse!.data?.balance}");
    print("walletAddress:${widget.playerResponse!.data?.walletAddress}");
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
                  const ChatSupportWidget(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.grey.withOpacity(0.5),
                        builder: (context) {
                          return ProfileButtonWidget(
                            userData: widget.playerResponse?.data ??
                                Data(
                                  nickname: '',
                                  email: '',
                                  phone: '',
                                ),
                          );
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
                        "assets/images/new_lobby/Lobby_balance.png",
                        width: MediaQuery.sizeOf(context).width / 2,
                      ),
                      Center(
                          child: BuildSubHeadingText(
                              color: Colors.white,
                              text:
                                  "\$ ${loginProvider.playerBalance ?? widget.playerBalance} USDC"))
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
                  CashierButtonWidget(
                    playerResponse: widget.playerResponse,
                  ),
                  TransferButtonWidget(
                    playerResponse: widget.playerResponse,
                  ),
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
              const Row(
                children: [
                  BuildButtonImageWidget(
                      imgPath: "assets/images/new_lobby/Holdem Active.png"),
                  BuildButtonImageWidget(
                      imgPath: "assets/images/new_lobby/Omaha Passive.png"),
                  BuildButtonImageWidget(
                      imgPath: "assets/images/new_lobby/Privte Passive.png"),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: balance! >= 100
                            ? () async {
                                bool success = await ratHole("100");
                                if (!mounted || !success) return;
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
                              }
                            : null, // Disabled if balance < 100
                        child: Image.asset(
                          balance >= 100
                              ? "assets/images/lobby/100 jeton.png"
                              : "assets/images/new_lobby/100 Jeton bw.png",
                          fit: BoxFit.fill,
                          width: MediaQuery.sizeOf(context).width / 2,
                          height: MediaQuery.sizeOf(context).height / 5,
                        ),
                      ),
                      GestureDetector(
                        onTap: balance! >= 200
                            ? () async {
                                bool success = await ratHole("200");
                                if (!mounted || !success) return;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameView(
                                      playerResponse: widget.playerResponse,
                                      buttonId: 200,
                                    ),
                                  ),
                                ).then((_) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.immersiveSticky);
                                });
                              }
                            : null,
                        child: Image.asset(
                          balance >= 200
                              ? "assets/images/lobby/200 jeton.png"
                              : "assets/images/new_lobby/200 Jeton bw.png",
                          fit: BoxFit.fill,
                          width: MediaQuery.sizeOf(context).width / 2,
                          height: MediaQuery.sizeOf(context).height / 5,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: balance! >= 500
                            ? () async {
                                bool success = await ratHole("500");
                                if (!mounted || !success) return;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameView(
                                      playerResponse: widget.playerResponse,
                                      buttonId: 500,
                                    ),
                                  ),
                                ).then((_) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.immersiveSticky);
                                });
                              }
                            : null,
                        child: Image.asset(
                          balance >= 500
                              ? "assets/images/new_lobby/500 Jeton (3).png"
                              : "assets/images/new_lobby/500 Jeton bw.png",
                          fit: BoxFit.fill,
                          width: MediaQuery.sizeOf(context).width / 2,
                          height: MediaQuery.sizeOf(context).height / 5,
                        ),
                      ),
                      GestureDetector(
                        onTap: balance! >= 1000
                            ? () async {
                                bool success = await ratHole("1000");
                                if (!mounted || !success) return;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameView(
                                      playerResponse: widget.playerResponse,
                                      buttonId: 1000,
                                    ),
                                  ),
                                ).then((_) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.immersiveSticky);
                                });
                              }
                            : null,
                        child: Image.asset(
                          balance >= 1000
                              ? "assets/images/new_lobby/1000 Jeton (3).png"
                              : "assets/images/new_lobby/1000 Jeton bw (1).png",
                          fit: BoxFit.fill,
                          width: MediaQuery.sizeOf(context).width / 2,
                          height: MediaQuery.sizeOf(context).height / 5,
                        ),
                      ),
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

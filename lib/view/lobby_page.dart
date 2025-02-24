import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerpad/model/login_response_model.dart';
import 'package:pokerpad/view/game_view.dart';
import 'package:pokerpad/view/lobby_avatar_view.dart';
import 'package:pokerpad/widget/affiliated_button_widget.dart';
import 'package:pokerpad/widget/build_icon_image_widget.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';
import 'package:pokerpad/widget/cashier_button_widget.dart';
import 'package:pokerpad/widget/elevated_button_custom.dart';
import 'package:pokerpad/widget/info_button_widget.dart';
import 'package:pokerpad/widget/profile_button_widget.dart';
import 'package:pokerpad/widget/transfer_button_widget.dart';
import 'package:pokerpad/widget/winners_widget.dart';

import '../constants/screen_size.dart';

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
    print(widget.playerResponse!.data?.nickname);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

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
                  GestureDetector(
                    onTap: () {
                      print("clicked");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.white54, width: 2),
                                  color: Colors.black),
                              width: width / 2,
                              height: height / 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BuildSubHeadingText(
                                    text: "self exclusion",
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BuildTextWidget(
                                    align: TextAlign.center,
                                    text:
                                        "Do you wish to exclude yourself for the \n"
                                        "next 24 hours from all game?",
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButtonCustom(
                                        onPress: () {},
                                        textColor: Colors.white54,
                                        text: "No",
                                        color: Color(0xff45474B),
                                      ),
                                      ElevatedButtonCustom(
                                        onPress: () {
                                          Navigator.pop(context);
                                        },
                                        textColor: Colors.black,
                                        text: "Yes",
                                        color: Color(0xffEEEEEE),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const BuildIconImageWidget(
                        imgName:
                            "assets/images/lobby/Self Exclusion Button.png"),
                  ),
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
                              text: "\$${widget.playerBalance}"))
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked");
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AffiliatedButtonWidget(),
                  CashierButtonWidget(),
                  TransferButtonWidget(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                                      return LobbyAvatarView();
                                    },
                                  );
                                },
                                child: Image.network(
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  height:
                                      MediaQuery.of(context).size.height / 2.7,

                                  widget.avatar ??
                                      "", // Use empty string if null
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.playerResponse?.data?.nickname ??
                                          "no name",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "ID ${widget.playerResponse?.data?.id ?? "no id"}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: MediaQuery.of(context).size.height / 2.7,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff3C3D37), width: 3),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return WinnersWidget();
                                },
                              );
                              // showDialog(
                              //   context: context,
                              //   builder: (context) {
                              //     return Dialog(
                              //       child: Container(
                              //         decoration: BoxDecoration(
                              //             border:
                              //                 Border.all(color: Colors.white),
                              //             color: Colors.black,
                              //             borderRadius: BorderRadius.circular(
                              //               20,
                              //             )),
                              //         height: height / 5,
                              //         width: width / 1.3,
                              //         child: Column(
                              //           children: [
                              //             const SizedBox(
                              //               height: 10,
                              //             ),
                              //             const BuildSubHeadingText(
                              //                 text: "Top winners",
                              //                 color: Colors.white),
                              //             Column(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 GestureDetector(
                              //                   onTap: () {
                              //                     showDialog(
                              //                       context: context,
                              //                       builder: (context) {
                              //                         return const TopMonthlyWinners();
                              //                       },
                              //                     );
                              //                   },
                              //                   child: Image.asset(
                              //                     width: width,
                              //                     "assets/images/lobby/top winners/Monthly Winners Button Passive.png",
                              //                   ),
                              //                 ),
                              //                 GestureDetector(
                              //                   onTap: () {
                              //                     showDialog(
                              //                       context: context,
                              //                       builder: (context) {
                              //                         return const TopYearlyWinners();
                              //                       },
                              //                     );
                              //                   },
                              //                   child: Image.asset(
                              //                     width: width,
                              //                     "assets/images/lobby/top winners/Yearly Winners Button Passive.png",
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // );
                            },
                            child: Image.asset(
                              "assets/images/lobby/Poker card.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 74, top: 8),
                        child: BuildSubHeadingText(
                          text: "Top winners",
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return WinnersWidget();
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

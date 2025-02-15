import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerpad/model/login_response_model.dart';
import 'package:pokerpad/view/game_view.dart';
import 'package:pokerpad/view/text_page.dart';
import 'package:pokerpad/widget/affiliated_button_widget.dart';
import 'package:pokerpad/widget/build_icon_image_widget.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/cashier_button_widget.dart';
import 'package:pokerpad/widget/top_monthly_winners.dart';
import 'package:pokerpad/widget/top_yearly_winners.dart';
import 'package:pokerpad/widget/transfer_button_widget.dart';

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
                  const BuildIconImageWidget(
                      imgName: "assets/images/lobby/Self Exclusion Button.png"),
                  const BuildIconImageWidget(
                      imgName:
                          "assets/images/lobby/profile button passive.png"),
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
                  const BuildIconImageWidget(
                      imgName: "assets/images/lobby/info button active.png"),
                  const BuildIconImageWidget(
                      imgName: "assets/images/lobby/Logo active (1).png"),
                ],
              ),
              Row(
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
                              Image.network(
                                width: MediaQuery.of(context).size.width / 2.1,
                                height:
                                    MediaQuery.of(context).size.height / 2.7,

                                widget.avatar ?? "", // Use empty string if null
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/user_img.png", // Fallback image
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
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
                  SizedBox(
                    width: 10,
                  ),
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
                              return Dialog(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      )),
                                  height: height / 5,
                                  width: width / 1.3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      const BuildSubHeadingText(
                                          text: "Top winners",
                                          color: Colors.white),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return TopMonthlyWinners();
                                                },
                                              );
                                            },
                                            child: Image.asset(
                                              width: width,
                                              "assets/images/lobby/top winners/Monthly Winners Button Passive.png",
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return TopYearlyWinners();
                                                },
                                              );
                                            },
                                            child: Image.asset(
                                              width: width,
                                              "assets/images/lobby/top winners/Yearly Winners Button Passive.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.network(
                          "https://img.freepik.com/premium-vector/playing-cards-dice-casino-logo-vector-illustration_396616-133.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                      Spacer(),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TextPage(),
                              ));
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

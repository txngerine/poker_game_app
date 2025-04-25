import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/kyc_seconday_avatar.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import '../provider/second_avatar_provider.dart';
import '../widget/build_heading_widget.dart';

class KycPickSecondaryAvatar extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const KycPickSecondaryAvatar({super.key, this.playerResponse});

  @override
  State<KycPickSecondaryAvatar> createState() => _KycPickSecondaryAvatarState();
}

class _KycPickSecondaryAvatarState extends State<KycPickSecondaryAvatar> {
  @override
  void initState() {
    super.initState();
    final userId = widget.playerResponse?.data?.id;
    if (userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<SecondAvatarProvider>(context, listen: false)
            .fetchSecondaryAvatarData(userId, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Consumer<SecondAvatarProvider>(
        builder: (context, secondAvatarProvider, child) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/lobby/lobby pattern.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 50),
                child: Container(
                  width: width / 1.2,
                  height: height / 1.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/avatar_new/avatar_content_field (1).png"),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 4),
                      const BuildHeadingWidget(
                        text: "Pick Secondary Avatar",
                        color: Colors.white70,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/pokerPadArt/frame for a avatar picture.png",
                            height: 470,
                          ),
                          SizedBox(
                            height: 450,
                            width: 360,
                            child: secondAvatarProvider.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : secondAvatarProvider.avatarImageUrls.isEmpty
                                    ? const Center(
                                        child: Text(
                                          "No secondary avatars found.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    : CarouselSlider(
                                        options: CarouselOptions(
                                          height: 450,
                                          enlargeCenterPage: true,
                                          autoPlay: false,
                                          viewportFraction: 1.5,
                                          onPageChanged: (index, reason) {
                                            secondAvatarProvider
                                                .setCurrentIndex(index);
                                          },
                                        ),
                                        items: secondAvatarProvider
                                            .avatarImageUrls
                                            .map((imageUrl) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return Container(
                                                width: 360,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  image: DecorationImage(
                                                    image:
                                                        NetworkImage(imageUrl),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: secondAvatarProvider.avatarImageUrls
                            .asMap()
                            .entries
                            .map((entry) {
                          return Container(
                            width: 40.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  secondAvatarProvider.currentIndex == entry.key
                                      ? "assets/images/primaryAvatar/page indicator_full.png"
                                      : "assets/images/primaryAvatar/page indicator_empty.png",
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: KycSecondaryAvatar(
                              playerResponse: widget.playerResponse,
                              selectedImageUrl:
                                  secondAvatarProvider.avatarImageUrls[
                                      secondAvatarProvider.currentIndex],
                            ),
                            type: PageTransitionType.rightToLeftWithFade,
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/avatar_new/pick_avatar_button (1).png",
                        width: MediaQuery.of(context).size.width / 1.3,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Image.asset(
                      "assets/images/pokerPadArt/retake selfie.png",
                      height: 15,
                      color: Colors.white70,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

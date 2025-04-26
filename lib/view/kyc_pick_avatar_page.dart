import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/kyc_primary_avatar.dart';
import 'package:provider/provider.dart';

import '../model/login_response_model.dart';
import '../provider/avatar_provider.dart';
import '../widget/build_heading_widget.dart';

class KycPickAvatarPage extends StatefulWidget {
  final LoginResponseModel? playerResponse;
  const KycPickAvatarPage({super.key, this.playerResponse});

  @override
  State<KycPickAvatarPage> createState() => _KycPickAvatarPageState();
}

class _KycPickAvatarPageState extends State<KycPickAvatarPage> {
  @override
  void initState() {
    super.initState();
    final userId = widget.playerResponse?.data?.id;
    if (userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<AvatarProvider>(context, listen: false)
            .fetchAvatarData(userId, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Consumer<AvatarProvider>(
        builder: (context, avatarProvider, child) {
          return Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
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
                              "assets/images/avatar_new/avatar_content_field (1).png")),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        const BuildHeadingWidget(
                          text: "Pick primary Avatar",
                          color: Colors.white70,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Frame Image
                            Image.asset(
                              "assets/images/pokerPadArt/frame for a avatar picture.png",
                              height: 470,
                            ),
                            // Carousel Slider
                            SizedBox(
                              height: 450,
                              width: 360,
                              child: avatarProvider.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : CarouselSlider(
                                      options: CarouselOptions(
                                        height:
                                            450, // Adjust height to fit the frame
                                        enlargeCenterPage: true,
                                        autoPlay: false,
                                        viewportFraction:
                                            1.5, // Show one image at a time
                                        onPageChanged: (index, reason) {
                                          // setState(() {
                                          //   _currentIndex = index;
                                          // });
                                          avatarProvider.setCurrentIndex(index);
                                        },
                                      ),
                                      items: avatarProvider.avatarImageUrls
                                          .map((imageUrl) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: 360,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                image: DecorationImage(
                                                  image: NetworkImage(imageUrl),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                            ),
                            // Stacked Dot Indicators
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: avatarProvider.avatarImageUrls
                              .asMap()
                              .entries
                              .map((entry) {
                            return Container(
                              // margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              width: avatarProvider.currentIndex == entry.key
                                  ? 40.0
                                  : 40.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(avatarProvider
                                                .currentIndex ==
                                            entry.key
                                        ? "assets/images/primaryAvatar/page indicator_full.png"
                                        : "assets/images/primaryAvatar/page indicator_empty.png")),
                                // color: _currentIndex == entry.key
                                //     ? Colors.white
                                //     : Colors.grey,
                                // shape: BoxShape.circle,
                                // border: Border.all(
                                //   color: Colors.white,
                                //   width: 1.0,
                                // ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    )),
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
                                child: KycPrimaryAvatar(
                                  playerResponse: widget.playerResponse,
                                  selectedImageUrl:
                                      avatarProvider.avatarImageUrls[
                                          avatarProvider.currentIndex],
                                ),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      child: Image.asset(
                          width: MediaQuery.of(context).size.width / 1.3,
                          "assets/images/avatar_new/pick_avatar_button (1).png"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      color: Colors.white70,
                      "assets/images/pokerPadArt/retake selfie.png",
                      height: 15,
                    ),
                    const SizedBox(
                      height: 5,
                    )
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

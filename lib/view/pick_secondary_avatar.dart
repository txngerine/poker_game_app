import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/view_secondary_avatar.dart';

class PickSecondaryAvatar extends StatefulWidget {
  const PickSecondaryAvatar({super.key});

  @override
  State<PickSecondaryAvatar> createState() => _PickSecondaryAvatarState();
}

class _PickSecondaryAvatarState extends State<PickSecondaryAvatar> {
  final List<String> avatarImageUrls = [
    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1d6554eb-bac4-4f59-a94a-1fc7f52b954b/dgdadq0-d51a8f45-264e-413b-bed0-535dd6599773.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzFkNjU1NGViLWJhYzQtNGY1OS1hOTRhLTFmYzdmNTJiOTU0YlwvZGdkYWRxMC1kNTFhOGY0NS0yNjRlLTQxM2ItYmVkMC01MzVkZDY1OTk3NzMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.UWGcP6YmpMH62a6IrkHuH2h76ko9mA2Fj-uqwe07hMU",
    "https://files.idyllic.app/files/static/3816357",
    "https://files.idyllic.app/files/static/3844151?width=640&optimizer=image",
    "https://files.idyllic.app/files/static/2211330?width=640&optimizer=image",
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                      width: 400,
                      "assets/images/pokerPadArt/pick your secondary avatar title.png"),
                  const SizedBox(
                    height: 60,
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
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 450, // Adjust height to fit the frame
                            enlargeCenterPage: true,
                            autoPlay: false,
                            viewportFraction: 1.5, // Show one image at a time
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          items: avatarImageUrls.map((imageUrl) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 360,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
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
                      Positioned(
                        bottom:
                            10, // Adjust as needed to position below the carousel
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              avatarImageUrls.asMap().entries.map((entry) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              width: _currentIndex == entry.key ? 12.0 : 12.0,
                              height: 18.0,
                              decoration: BoxDecoration(
                                color: _currentIndex == entry.key
                                    ? Colors.white
                                    : Colors.grey,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors
                                      .white, // Outline for active/inactive dots
                                  width: 1.0,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Swipe to see your Avatar",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: ViewSecondaryAvatar(
                                  selectedImageUrl:
                                      avatarImageUrls[_currentIndex]),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: Image.asset(
                        width: MediaQuery.of(context).size.width / 1.3,
                        "assets/images/pokerPadArt/pick avatar button.png"),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/pokerPadArt/retake selfie.png",
                    height: 15,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

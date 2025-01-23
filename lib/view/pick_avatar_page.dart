import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/view_primary_avatar.dart';

class PickAvatarPage extends StatefulWidget {
  const PickAvatarPage({super.key});

  @override
  State<PickAvatarPage> createState() => _PickAvatarPageState();
}

class _PickAvatarPageState extends State<PickAvatarPage> {
  final List<String> avatarImageUrls = [
    "https://img.freepik.com/free-photo/beautiful-young-business-woman-glasses-suit-3d-rendering_1142-51185.jpg",
    "https://img.freepik.com/free-photo/3d-illustration-young-businessman-with-glasses-mustache-his-head_1142-38718.jpg",
    "https://img.freepik.com/free-photo/portrait-young-beautiful-business-woman-glasses-3d-rendering_1142-43635.jpg",
    "https://img.freepik.com/free-photo/portrait-smiling-business-woman-glasses-with-headphones-grey-background_1142-54747.jpg",
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
                      "assets/images/pokerPadArt/pick your primary avatar title.png"),
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
                              child: ViewPrimaryAvatar(
                                selectedImageUrl:
                                    avatarImageUrls[_currentIndex],
                              ),
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/view_secondary_avatar.dart';

import '../controller/get_avatar_controller.dart';

class PickSecondaryAvatar extends StatefulWidget {
  const PickSecondaryAvatar({super.key});

  @override
  State<PickSecondaryAvatar> createState() => _PickSecondaryAvatarState();
}

class _PickSecondaryAvatarState extends State<PickSecondaryAvatar> {
  final List<String> avatarImageUrls = [];
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAvatarData();
  }

  Future<void> _fetchAvatarData() async {
    try {
      GetAvatarController getAvatarController = GetAvatarController();
      final response = await getAvatarController.getAvatar();
      if (response != null) {
        final primaryAvatars = response.data.secondary;

        setState(() {
          avatarImageUrls.clear();
          avatarImageUrls.addAll([
            primaryAvatars.avatar5,
            primaryAvatars.avatar6,
            primaryAvatars.avatar7,
            primaryAvatars.avatar8,
            primaryAvatars.avatar9,
          ]);
        });
      }
    } catch (e) {
      // Handle error (e.g., display a message to the user)
      print("Error fetching avatar data: $e");
    }
  }

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
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
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
                        height: 450,
                        width: 360,
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
                  SizedBox(
                    height: 50,
                  ),
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

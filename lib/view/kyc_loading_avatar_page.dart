import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/pick_avatar_page.dart';

import '../constants/screen_size.dart';
import '../controller/get_avatar_controller.dart';
import '../widget/build_heading_widget.dart';

class KycLoadingAvatarPage extends StatefulWidget {
  const KycLoadingAvatarPage({super.key});

  @override
  State<KycLoadingAvatarPage> createState() => _KycLoadingAvatarPageState();
}

class _KycLoadingAvatarPageState extends State<KycLoadingAvatarPage> {
  final GetAvatarController _getAvatarController = GetAvatarController();
  bool isLoading = true;
  late Timer _timer; // Declare Timer for periodic refresh

  @override
  void initState() {
    super.initState();

    // Start the periodic timer to refresh every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 20), (_) {
      fetchAvatarData();
    });

    // Initial fetch when the page loads
    fetchAvatarData();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Future<void> fetchAvatarData() async {
    setState(() {
      isLoading = true; // Trigger a rebuild and show loading state
    });

    final avatarData = await _getAvatarController.getAvatar();
    if (avatarData != null && avatarData.status == "OK") {
      print("Avatar fetched successfully: ${avatarData.status}");
      _timer.cancel();
      Navigator.push(
        context,
        PageTransition(
          child: const PickAvatarPage(),
          type: PageTransitionType.rightToLeftWithFade,
        ),
      );
    } else {
      print("Avatar data fetch failed.");
      if (avatarData == null) {
        print("Avatar data is null.");
      } else {
        print("Avatar status: ${avatarData.status}");
      }

      setState(() {
        isLoading = false; // Stop loading after trying to fetch the data
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 2),
            content: Text("Please wait... Your avatar is being generated")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  const BuildHeadingWidget(
                    color: Colors.white70,
                    text: "Loading Avatars",
                  ),
                  // Show a loading indicator or the avatar data
                  isLoading
                      ? Image.asset(
                          height: 250,
                          width: 250,
                          "assets/images/3d/ezgif.com-gif-maker (1).gif",
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          height: 250,
                          width: 250,
                          "assets/images/3d/ezgif.com-gif-maker (1).gif",
                          fit: BoxFit.fill,
                        ),
                  const SizedBox(
                    height: 50,
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

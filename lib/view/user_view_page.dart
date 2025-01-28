// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:pokerpad/model/player_name_response_model.dart';
// import 'package:pokerpad/view/lobby_page.dart';
// import 'package:pokerpad/widget/build_heading_text.dart';
// import 'package:pokerpad/widget/build_text_widget.dart';
//
// import '../constants/screen_size.dart';
// import '../controller/player_details_controller.dart';
//
// class UserViewPage extends StatefulWidget {
//   const UserViewPage({super.key});
//
//   @override
//   State<UserViewPage> createState() => _UserViewPageState();
// }
//
// class _UserViewPageState extends State<UserViewPage> {
//   String playerName = "Loading...";
//   bool isLoading = true;
//   PlayerNameResponseModel? playerDetails;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPlayerName();
//   }
//
//   void fetchPlayerName() async {
//     PlayerDetailsController playerNameController = PlayerDetailsController();
//     try {
//       final response = await playerNameController.fetchPlayerDetails();
//       if (response != null) {
//         setState(() {
//           playerDetails = response;
//           playerName = response.data?.nickname ?? "No name available";
//         });
//       } else {
//         setState(() {
//           playerName = "Error loading name";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         playerName = "Failed to fetch name";
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Container(
//             height: ScreenSize.screenHeight,
//             width: ScreenSize.screenWidth,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/background.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 const BuildHeadingText(text: "CONGRATULATIONS"),
//                 isLoading
//                     ? const CircularProgressIndicator()
//                     : BuildHeadingText(text: playerName),
//                 const BuildTextWidget(text: "You are now ready to play"),
//                 const SizedBox(height: 10),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.grey,
//                   ),
//                   height: 450,
//                   width: 390,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(30),
//                       child: Image.asset(
//                         "assets/images/user_img.png",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const BuildTextWidget(
//                   text: "The above picture is just a temporary Avatar.",
//                 ),
//                 const BuildTextWidget(
//                   text:
//                       "A premium Avatar will be created for you within 24 hours",
//                 ),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       PageTransition(
//                         child: LobbyPage(
//                           playerBalance: playerDetails?.data?.balance,
//                         ),
//                         type: PageTransitionType.rightToLeftWithFade,
//                       ),
//                     );
//                   },
//                   child: Image.asset("assets/images/pokerpad_nt_button.png"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

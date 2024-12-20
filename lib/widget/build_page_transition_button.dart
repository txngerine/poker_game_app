// import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';
//
// class BuildPageTransitionButton extends StatelessWidget {
//   final String buttonText;
//   final Widget destinationPage;
//   final Duration transitionDuration;
//
//   const BuildPageTransitionButton({
//     Key? key,
//     required this.buttonText,
//     required this.destinationPage,
//     this.transitionDuration = const Duration(seconds: 1, milliseconds: 500),
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).pushReplacement(
//           PageRouteBuilder(
//             transitionDuration: transitionDuration,
//             reverseTransitionDuration: transitionDuration,
//             pageBuilder: (context, animation, secondaryAnimation) {
//               return destinationPage;
//             },
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return SharedAxisTransition(
//                 animation: animation,
//                 secondaryAnimation: secondaryAnimation,
//                 transitionType: SharedAxisTransitionType.vertical,
//                 child: child,
//               );
//             },
//           ),
//         );
//       },
//       child: Text(
//         buttonText,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }

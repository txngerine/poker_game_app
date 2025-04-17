// import 'package:flutter/material.dart';

// class Bonuses2kButtonWidget extends StatefulWidget {
//   const Bonuses2kButtonWidget({super.key});

//   @override
//   State<Bonuses2kButtonWidget> createState() => _Bonuses2kButtonWidgetState();
// }

// class _Bonuses2kButtonWidgetState extends State<Bonuses2kButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 40,
//           height: 17,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20), color: Colors.black),
//           child: const Center(
//             child: Text(
//               "\$2k",
//               style: TextStyle(fontSize: 10, color: Colors.white),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 1,
//         ),
//         Container(
//           height: 6,
//           width: 1,
//           color: Colors.white,
//         )
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

class BonusesButtonWidget extends StatefulWidget {
  final String label;

  const BonusesButtonWidget({super.key, required this.label});

  @override
  State<BonusesButtonWidget> createState() => _BonusesButtonWidgetState();
}

class _BonusesButtonWidgetState extends State<BonusesButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 1),
        Container(
          height: 6,
          width: 1,
          color: Colors.white,
        ),
      ],
    );
  }
}

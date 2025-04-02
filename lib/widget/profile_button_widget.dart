// import 'package:flutter/material.dart';

// import 'build_sub_heading_text.dart';
// import 'build_text_widget.dart';

// class ProfileButtonWidget extends StatefulWidget {
//   const ProfileButtonWidget({super.key});

//   @override
//   State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
// }

// class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     return Dialog(
//       child: Container(
//         height: height / 2.3,
//         width: width,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.white),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   BuildSubHeadingText(
//                     text: "WhatEverMan",
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                   Spacer(),
//                   BuildSubHeadingText(
//                     text: "ID:",
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   )
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(
//                     Icons.mail,
//                     color: Colors.white,
//                     size: 12,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   BuildTextWidget(
//                     text: "whateverman@gmail.com",
//                     color: Colors.white,
//                     fontSize: 12,
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.phone,
//                     color: Colors.white,
//                     size: 12,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const BuildTextWidget(
//                     text: "Enter your mobile number",
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                     width: width / 3,
//                     child: ElevatedButton(
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 WidgetStatePropertyAll(Colors.white)),
//                         onPressed: () {},
//                         child: const BuildSubHeadingText(
//                           text: "change avatar",
//                           fontSize: 12,
//                           color: Colors.black,
//                         )),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       const BuildSubHeadingText(
//                         fontSize: 15,
//                         text: "FACIAL VERIFICATION",
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Color(0xff3C3D37))),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "pending",
//                               fontSize: 12,
//                               color: Colors.white70,
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const BuildSubHeadingText(
//                         fontSize: 15,
//                         text: "PROOF OF IDENTITY",
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Color(0xff79D7BE))),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "verified",
//                               fontSize: 12,
//                               color: Colors.white70,
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const BuildSubHeadingText(
//                         fontSize: 15,
//                         text: "PROOF OF ADDRESS",
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Color(0xffB43F3F))),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "rejected",
//                               fontSize: 12,
//                               color: Colors.white70,
//                             )),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   Column(
//                     children: [
//                       Container(
//                         height: 200,
//                         color: const Color(0xff424242),
//                         width: width / 3,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Colors.white)),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "try again",
//                               fontSize: 12,
//                               color: Colors.black,
//                             )),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xFF3C3D37),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: width * 0.9,height: height * 0.36,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/profilebutton/bank_frame.png"),
            fit: BoxFit.none,
          ),borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/profilebutton/name_field.png"),fit: BoxFit.cover),borderRadius: BorderRadius.circular(20),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "  Jasper Den Hollander",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "ID: 113  ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Flexible(
                      child: Row(
                        children: const [
                          Icon(Icons.mail, color: Colors.white70, size: 18),
                          SizedBox(width: 10),
                          Text(
                            "jasper.from.holand@gmail.com",
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.phone, color: Colors.white70, size: 18),
                        SizedBox(width: 10),
                        Text(
                          "+38651646587",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/profilebutton/kyc_field.png"),fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "KYC Verification",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Face Check",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Verified",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Proof of Identity",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Verified",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

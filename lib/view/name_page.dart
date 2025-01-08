import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/user_view_page.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';

import '../constants/screen_size.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: ScreenSize.screenHeight,
            width: ScreenSize.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffB7B7B7),
              ),
              height: 400,
              width: 420,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const BuildSubHeadingText(
                      text: "CHOOSE YOUR NICKNAME",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: BuildTextFieldWidget(
                        controller: nameController,
                        hintText: "Enter Name",
                        labelText: '',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            print("form validated");
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const UserViewPage(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                          } else {
                            print("error in form state");
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white)),
                        child: const Text(
                          "  Continue  ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

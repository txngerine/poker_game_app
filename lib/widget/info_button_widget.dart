import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class InfoButtonWidget extends StatefulWidget {
  const InfoButtonWidget({super.key});

  @override
  State<InfoButtonWidget> createState() => _InfoButtonWidgetState();
}

class _InfoButtonWidgetState extends State<InfoButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              20,
            )),
        height: height / 2,
        width: width,
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BuildSubHeadingText(
                text: "HOUSE RULES",
                fontSize: 30,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text: "Rake",
                color: Colors.white,
                fontSize: 15,
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text: "   Rake is a capped at 2.5% for all games.\n"
                    "  no service fee for all in equity cashout.\n"
                    "no preflop rake or suprice fee of any sort",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 11,
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text: "Tables",
                color: Colors.white,
                fontSize: 15,
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text:
                    "All tables are classic casino cash game format with eighty seats.\n"
                    "    A mininum of five players is required for the game to start.\n",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 11,
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text: "Selection",
                color: Colors.white,
                fontSize: 15,
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text:
                    "An algorithm chooses players seats based on there stacksizes.\n",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 11,
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text: "Stakes",
                color: Colors.white,
                fontSize: 15,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: BuildSubHeadingText(
                  text:
                      "An algorithm decides tabel-stackes based on players stacksizes.\n"
                      "                                           The stakes vary between:\n"
                      "                                             \$1\$1    \$1\$2      \$2\$4",
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BuildSubHeadingText(
                text: "Ante",
                color: Colors.white,
                fontSize: 15,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: BuildSubHeadingText(
                  text:
                      "All game have a big blind ante in the amount of five big blinds.\n",
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

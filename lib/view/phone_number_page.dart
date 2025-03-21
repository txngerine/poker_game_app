import 'package:flutter/material.dart';

import '../constants/screen_size.dart';
import '../model/country_list.dart';
import '../widget/build_text_widget.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  String countryCode = "+1"; // Default country code
  String countryFlag = "🇺🇸"; // Default flag
  String phoneNumber = ""; // Store entered phone number

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300], // Soft gray background
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
          Container(
            width: width / 1,
            height: height / 1.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/phone&country/log-reg frame.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                BuildTextWidget(
                  text: "Phone Number",
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
                const SizedBox(height: 50),
                Image.asset("assets/images/phone&country/phone icon (1).png"),
                const SizedBox(height: 100),
                // Country Code Picker + Phone Number Input
                Container(
                  width: width / 1.5,
                  height: 50,
                  child: Row(
                    children: [
                      // Country Code Picker
                      GestureDetector(
                        onTap: () => _showCountryPicker(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/phone&country/code text field (1).png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Background Flag Holder Image
                                  // Image.asset(
                                  //   "assets/images/phone&country/flag holder.png",
                                  //   width: 28, // Adjust width as needed
                                  //   height: 35,
                                  //   fit: BoxFit.cover,
                                  // ),

                                  Text(
                                    countryFlag, // Unicode flag emoji from List<Country>
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),

                              // Country Code
                              Text(
                                countryCode,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Phone Number Input
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/phone&country/country text field.png"),
                                fit: BoxFit.fill, // Adjust as needed
                              ),
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded corners
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color:
                                      Colors.black), // Ensure text is visible
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                filled: true,
                                fillColor: Colors
                                    .transparent, // Transparent so the image is visible
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),

                                // Hide default border to keep image look
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  phoneNumber = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 6,
                ),
                Image.asset(
                    width: width / 1.5,
                    "assets/images/phone&country/confirm button (1).png")
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom Country Picker Modal
  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) {
        return SizedBox(
          height: 400,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "Select Country",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search country",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (query) {
                    setState(() {
                      countries = countries
                          .where((country) => country.name
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Country List
              Expanded(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final country = countries[index];
                    return ListTile(
                      leading: Text(
                        country.flag,
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: Text(
                        country.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: Text(
                        country.dialCode,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                      onTap: () {
                        setState(() {
                          countryFlag = country.flag;
                          countryCode = country.dialCode;
                        });
                        Navigator.pop(context); // Close modal
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/screen_size.dart';
import '../provider/country_provider.dart';
import '../widget/build_text_widget.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _getStoredDeviceId();
  // }
  //
  // String _deviceId = "Fetching...";
  //
  // Future<void> _getStoredDeviceId() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? storedDeviceId = pref.getString("device_id");
  //
  //   setState(() {
  //     _deviceId = storedDeviceId ?? "No Device ID Found";
  //   });
  //   print("Updated Device ID: $_deviceId");
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final countryProvider = Provider.of<CountryProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
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
            width: width,
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
                const SizedBox(height: 30),
                BuildTextWidget(
                  text: "Phone Number",
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
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
                        onTap: () {
                          countryProvider.resetFilteredCountries();
                          _showCountryPicker(context);
                        },
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
                              Text(
                                countryProvider.countryFlag,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                countryProvider.countryCode,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/phone&country/country text field.png"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                              onChanged: countryProvider.updatePhoneNumber,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 8),
                GestureDetector(
                  onTap: () {
                    countryProvider.sentPhoneNumber(context);
                  },
                  child: Image.asset(
                    width: width / 1.5,
                    "assets/images/phone&country/confirm button (1).png",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCountryPicker(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final countryProvider =
        Provider.of<CountryProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter, // Moves the dialog to the top
          child: Material(
            // Ensures background transparency works
            color: Colors.transparent,
            child: Container(
              width: width / 1.1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/phone&country/country code frame.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  BuildTextWidget(
                    text: "Country Code",
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black54,
                  ),
                  // BuildTextWidget(
                  //   text: "Country Code",
                  //   fontSize: 25,
                  //   fontWeight: FontWeight.w700,
                  //   color: Colors.black54,
                  // ),

                  // Search Field
                  SizedBox(
                    width: width / 1.3,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/phone&country/country text field.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter country name",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.all(14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: countryProvider.searchCountry),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ListView inside a scrollable container
                  Container(
                    width: width / 1.3,
                    height: height / 1.2,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Consumer<CountryProvider>(
                      builder: (context, provider, child) {
                        return provider.filteredCountries.isEmpty
                            ? const Center(
                                child: Text("No Results Found",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey)))
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: provider.filteredCountries.length,
                                  itemBuilder: (context, index) {
                                    final country =
                                        provider.filteredCountries[index];
                                    return ListTile(
                                      leading: Text(country.flag,
                                          style: const TextStyle(fontSize: 20)),
                                      title: Text(
                                        country.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      trailing: Text(
                                        country.dialCode,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      onTap: () {
                                        provider.selectCountry(country);
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

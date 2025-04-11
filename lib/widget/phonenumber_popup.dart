
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/country_provider.dart';
import '../widget/build_text_widget.dart';

void showPhoneNumberPopup(BuildContext context, {required String phoneNumber,required Function(String) onPhoneNumberUpdated, required int userId,}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child:  PhoneNumberPopupContent(
          initialPhone: phoneNumber,
          onPhoneNumberSaved: onPhoneNumberUpdated, userId: userId,
        ),
      );
    },
  );
}

// class PhoneNumberPopupContent extends StatelessWidget {
//   final TextEditingController phoneController;
//   final Function(String) onPhoneNumberSaved;

//   PhoneNumberPopupContent({
//     Key? key,
//     required String initialPhone,
//     required this.onPhoneNumberSaved,
//   })  : phoneController = TextEditingController(text: initialPhone),
//         super(key: key);

class PhoneNumberPopupContent extends StatelessWidget {
  final TextEditingController phoneController;
  final Function(String) onPhoneNumberSaved;
  final int userId;

  PhoneNumberPopupContent({
    Key? key,
    required String initialPhone,
    required this.userId,
    required this.onPhoneNumberSaved,
  })  : phoneController = TextEditingController(text: initialPhone),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final countryProvider = Provider.of<CountryProvider>(context);

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: height / 1.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/phonenumbpopupassets/phone_number_bg.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  BuildTextWidget(
                    text: "Phone Number",
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 50),
                  Image.asset("assets/images/phonenumbpopupassets/phone_icon.png"),
                  const SizedBox(height: 100),
                  Container(
                    width: width / 1.5,
                    height: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            countryProvider.resetFilteredCountries();
                            Future.delayed(const Duration(milliseconds: 300), () {
                              showCountryPickerPopup(context);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 55,
                            width: 110,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/phonenumbpopupassets/country_selection.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  countryProvider.countryFlag,
                                  width: 33,
                                  height: 33,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  countryProvider.countryCode,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/images/phonenumbpopupassets/number_field.png"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              controller: phoneController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(fontSize: 12, color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height / 8),
                  GestureDetector(
                   onTap: () async {
          await countryProvider.updatePhoneNumbe(context, userId, phoneController.text);
          onPhoneNumberSaved(phoneController.text);
          Navigator.pop(context);
        },
                    child: Image.asset(
                      width: width / 1.5,
                      "assets/images/phonenumbpopupassets/confirm_button_black.png",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


void showCountryPickerPopup(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: CountryPickerPopupContent(width: width, height: height),
      );
    },
  );
}

class CountryPickerPopupContent extends StatelessWidget {
  final double width;
  final double height;

  const CountryPickerPopupContent({required this.width, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);

    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/phonenumbpopupassets/1st_level.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          
          const SizedBox(height: 40),
          BuildTextWidget(
            text: "Country Code",
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),

          // Search Field
          SizedBox(
            width: width / 1.4,
            height: 55,
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/phonenumbpopupassets/countru_search_field.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter country name",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                ),
                onChanged: provider.searchCountry,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // List of Countries
          Container(
            width: width / 1.4,
            height: height / 1.33,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/phonenumbpopupassets/2nd_lavel.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Consumer<CountryProvider>(
              builder: (context, provider, child) {
                return provider.filteredCountries.isEmpty
                    ? const Center(
                        child: Text("No Results Found", style: TextStyle(fontSize: 16, color: Colors.grey)))
                    : Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.filteredCountries.length,
                          itemBuilder: (context, index) {
                            final country = provider.filteredCountries[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.all(5),
                              leading: Container(
                                width: 68,
                                height: 68,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/phonenumbpopupassets/flag_field.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    country.flag,
                                    width: 45,
                                    height: 45,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text(
                                country.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              trailing: Text(
                                country.dialCode,
                                style: const TextStyle(fontSize: 16, color: Colors.white),
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
    );
  }
}

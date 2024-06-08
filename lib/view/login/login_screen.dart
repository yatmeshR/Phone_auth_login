import 'package:country_picker/country_picker.dart';
import 'package:dits_nexcom/repository/auth_repository.dart';
import 'package:dits_nexcom/utils/utils.dart';
import 'package:dits_nexcom/view/view.dart';
import 'package:dits_nexcom/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final phoneControllerProvider =
Provider<TextEditingController>((ref) => TextEditingController());

class SelectedCountryState extends StateNotifier<Country> {
  SelectedCountryState(Country country) : super(country);

  void updateCountry(Country newCountry) {
    state = newCountry;
  }
}

final selectedCountryProvider =
StateNotifierProvider<SelectedCountryState, Country>((ref) {
  return SelectedCountryState(Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  ));
});

final sendPhoneNumberProvider = Provider.autoDispose((ref) {
  final ap = ref.read(authProvider);
  final phoneController = ref.read(phoneControllerProvider);
  final selectedCountryState = ref.watch(selectedCountryProvider); // Accessing the state
  return (BuildContext context) {
    final phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(
      context,
      "+${selectedCountryState.phoneCode}$phoneNumber",
    );
  };
});


class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = ref.watch(phoneControllerProvider);
    final selectedCountry = ref.watch(selectedCountryProvider);

    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                const SizedBox(height: 200),
                _headingWidget(),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.white,
                  controller: phoneController,
                  style: GoogleFonts.ptSerif(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  // onChanged: (value) {
                  //   phoneController.text = value;
                  // },
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    hintStyle: GoogleFonts.ptSerif(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              ref
                                  .read(selectedCountryProvider.notifier)
                                  .updateCountry(value);
                            },
                          );
                        },
                        child: CaptionText(
                          title: "${selectedCountry
                              .flagEmoji} + ${selectedCountry
                              .phoneCode}",
                        ),

                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9
                        ? Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.positive,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FlatButton(
                    title: "Login",
                    onPressed: () {
                      final sendPhoneNumber =
                      ref.read(sendPhoneNumberProvider); // Access the provider
                      sendPhoneNumber(context);
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>OtpScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget _headingWidget(){
  return const Column(
    children: [
      TitleText(title: 'Enter Phone Number'),
      SizedBox(height: 10),
      SubTitleText(
        title:
        'Please enter your 10 digit mobile number to receive OTP',
      ),
    ],
  );
}





  // void sendPhoneNumber(BuildContext context) {
  //   final ap = ref.read(authProvider);
  //   String phoneNumber = phoneController.text.trim();
  //   final selectedCountry = ref.read(selectedCountryProvider);
  //   ap.signInWithPhone(
  //       context, "+${selectedCountry.phoneCode}$phoneNumber");
  // }


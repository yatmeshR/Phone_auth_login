import 'package:dits_nexcom/utils/utils.dart';
import 'package:dits_nexcom/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  //final String verificationId;
  const OtpScreen({
    super.key, //required this.verificationId
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                _topWidget(context),
                const SizedBox(height: 20),
                TitleText(title: 'Verify Number'),
                const SizedBox(height: 10),
                SubTitleText(
                    title:
                        'Please enter the OTP received to verify your number'),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: FlatButton(
                    title: "Verify",
                    onPressed: () {
                      // if (otpCode != null) {
                      //   verifyOtp(context, otpCode!);
                      // } else {
                      //   showSnackBar(context, "Enter 6-Digit code");
                      // }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // const Text(
                //   "Didn't receive any code?",
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //   ),
                // ),
                SubTitleText(title: "Resend New Code")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _topWidget(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,boxShadow: [
            BoxShadow(
              color: AppColor.titleColor, // Outer shadow color
              offset: Offset(-2, -3), // Outer shadow offset
              blurRadius: 8, // Outer shadow blur radius
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: const Icon(Icons.arrow_back),
          )),
    ),
  );
}

import 'package:dits_nexcom/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: GoogleFonts.ptSerif(
      color: AppColor.titleColor,
      fontWeight: FontWeight.w400,
      fontSize: 24,
    )
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String title;
  const SubTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,textAlign: TextAlign.center, style: GoogleFonts.ptSerif(
      color: AppColor.title2Color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    )
    );
  }
}

class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,textAlign: TextAlign.center, style: GoogleFonts.ptSerif(
      color: AppColor.title2Color,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    )
    );
  }
}

class CaptionText extends StatelessWidget {
  final String title;
  const CaptionText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,textAlign: TextAlign.center, style: GoogleFonts.ptSerif(
      color: AppColor.titleColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    )
    );
  }
}




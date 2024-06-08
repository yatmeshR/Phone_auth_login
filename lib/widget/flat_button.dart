import 'package:dits_nexcom/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlatButton extends StatelessWidget {
  const FlatButton({super.key,this.minWidth=140,this.btnRadius=10,required this.title,this.btnHeight=48,required this.onPressed});
  final double minWidth;
  final double btnRadius;
  final String title;
  final double btnHeight;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
             BoxShadow(
            color: AppColor.bottomShadow, // Outer shadow color
            offset: Offset(-2, -3), // Outer shadow offset
            blurRadius: 8, // Outer shadow blur radius
          ),
        ],
      ),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(btnRadius)),
          minWidth: minWidth,
          height: btnHeight,
          color: AppColor.bgColor,
          onPressed:onPressed,
          child: Center(child: Text(title,style:GoogleFonts.ptSerif(
            color: AppColor.buttonTextColor,
            fontSize: MediaQuery.of(context).size.width > 600 ? 14 : 12,
            fontWeight: FontWeight.w400,
          ),))),
    );
  }
}
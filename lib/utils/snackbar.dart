import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text,{Duration duration = const Duration(seconds: 10)}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text) ,
        duration: duration,
      ));
}
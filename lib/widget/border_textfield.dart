
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BorderTextField extends StatelessWidget {
  const BorderTextField({
    super.key,
    this.onTap,
    this.controller,
    this.focusNode,
    this.errorText,
    this.onSave,
    this.hintText,
    this.validator,
    this.labelText,
    this.onSubmitted,
    this.readOnly = false,
    this.textInputAction,
    this.isSuffix = false,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixWidget,
    this.prefixIcon,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.isValidate = false,
    this.inputFormatters,
    this.maxLines = 1,
  });

  final Function()? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function(String)? validator;
  final Function(String)? onSave;
  final String? labelText;
  final String? hintText;
  final int? maxLength;
  final bool isSuffix;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isValidate;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onTap: onTap,
      onFieldSubmitted: onSubmitted,
      cursorColor: Colors.grey,
      validator: validator != null ? (value) => validator!(value!) : null,
      controller: controller,
      autofocus: false,
      obscureText: obscureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onSaved: onSave != null ? (value) => onSave!(value!) : null,
      maxLength: maxLength,
      onChanged: onChanged,
      readOnly: readOnly,
      textInputAction: textInputAction,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        errorText: errorText,
        prefix: prefixWidget,
        prefixIcon: prefixIcon,
        suffixIcon: isSuffix ? suffixIcon : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
                color: Colors.white
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: isValidate
            //     ? Colors.red
            //     : userService.appTheme == 'dark'
            //     ? Colors.black
            //     : Colors.black,
            width: isValidate ? 1.0 : 0.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.5),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w300),
        labelStyle:  TextStyle(fontSize: MediaQuery.of(context).size.width > 600 ? 12 : 10,color: Colors.white,),
        helperStyle: const TextStyle(color: Colors.red),
        counterStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12.2),
        labelText: labelText,
        contentPadding: const EdgeInsets.only(left: 14),
      ),
    );
  }
}

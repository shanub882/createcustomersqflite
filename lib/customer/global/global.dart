import 'package:flutter/material.dart';

// customiseStyle(Colors, FontWeight, fontSize) {
//   return GoogleFonts.poppins(
//       textStyle:
//           TextStyle(fontWeight: FontWeight, color: Colors, fontSize: fontSize));
// }

TextStyle customiseStyle(Color color, FontWeight fontWeight, double fontSize) {
  return TextStyle(
    fontWeight: fontWeight,
    color: color,
    fontSize: fontSize,
    fontFamily: 'Arial',
  );
}

TextStyle hintTextStyle(Color color, FontWeight fontWeight, double fontSize) {
  return TextStyle(
    fontWeight: fontWeight,
    color: color,
    fontSize: fontSize,
    fontFamily: 'Arial',
  );
}

// hinttextStyle(Colors, FontWeight, fontSize) {
//   return GoogleFonts.poppins(
//       textStyle:
//           TextStyle(fontWeight: FontWeight, color: Colors, fontSize: fontSize));
// }

InputDecoration newDesignTextfield({
  String hintText = "",
  Widget? prefixIcon,
  Widget? suffixIcon,
  TextStyle? hintStyle,
}) {
  return InputDecoration(
    labelText: hintText,
    labelStyle: hintStyle ??
        customiseStyle(const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFFFFFF)),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF004775)),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFFFFFF)),
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );
}

import 'package:flutter/material.dart';

TextStyle header1TextStyle() {
  return const TextStyle(
    // color: Color(0xff000000),
    fontSize: 24.0,
  );
}

TextStyle header2TextStyle() {
  return const TextStyle(
    // color: Color(0xff000000),
    fontSize: 14.0,
  );
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    ),
  );
}

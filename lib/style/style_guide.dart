import 'package:flutter/material.dart';

// Shared text styles and button styles
// ================================================================

/// Large header style (24pt) — used for section titles.
TextStyle header1TextStyle() {
  return const TextStyle(
    // color: Color(0xff000000),
    fontSize: 24.0,
  );
}

/// Small header style (14pt) — used for button labels and subheadings.
TextStyle header2TextStyle() {
  return const TextStyle(
    // color: Color(0xff000000),
    fontSize: 14.0,
  );
}

/// Default button style with compact padding.
ButtonStyle buttonStyle() {
  return ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    ),
  );
}

// ================================================================

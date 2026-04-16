import 'package:flutter/material.dart';

/// App-wide color palette derived from the excalidraw wireframe.
///
/// HOW TO USE THIS FILE:
/// ---------------------
/// Instead of hardcoding hex colors like Color(0xff4CAF50) throughout your
/// widgets, reference these constants: AppColors.green, AppColors.red, etc.
///
/// This gives you two big wins:
///   1. **Consistency** — every "green" in the app is the same green.
///   2. **Easy changes** — want to tweak the green? Change it here, and it
///      updates everywhere automatically.
///
/// HOW TO REPLICATE THIS PATTERN:
/// ------------------------------
/// When you add a new color to the wireframe:
///   1. Add a static const here with a semantic name (e.g. `teal`).
///   2. Use it in your widgets: `color: AppColors.teal`
///   3. If a color is only used for one specific purpose (like an error state),
///      give it a semantic name: `static const Color error = Color(...)`.
///
/// When you want light/dark variants of a color, you can use Flutter's
/// built-in methods:
///   - `AppColors.green.withValues(alpha: 0.5)` — 50% transparent
///   - `Color.lerp(AppColors.green, Colors.white, 0.3)` — 30% lighter
///
/// NAMING CONVENTION:
/// ------------------
/// Keep names simple and descriptive. If a color maps to a specific role
/// (like "cancel button is always red"), you can add a semantic alias:
///   `static const Color cancel = red;`
///   `static const Color confirm = orange;`
/// This way the code reads naturally: `color: AppColors.cancel`
class AppColors {
  // Prevent instantiation — this is a constants-only class
  AppColors._();

  // Core palette
  // ================================================================

  /// Green — used for: team input fields, start/new buttons, Team Management
  /// nav button, positive actions
  static const Color green = Color(0xFF4CAF50);

  /// Red/Pink — used for: opponent input fields, cancel buttons, game history
  /// highlights
  static const Color red = Color(0xFFE53935);

  /// Orange — used for: confirm buttons, Start Game nav button, game history
  /// highlights
  static const Color orange = Color(0xFFFF9800);

  /// Purple — used for: game rules dropdown, Tournament Page nav button,
  /// offense/defense toggle selection
  static const Color purple = Color(0xFF7E57C2);

  /// Blue — used for: format dropdown, player table, Add Game button
  static const Color blue = Color(0xFF42A5F5);

  /// Pink — used for: Settings nav button, team card accents
  static const Color pink = Color(0xFFEC407A);

  /// Yellow — used for: tournament history rows, game history highlights
  static const Color yellow = Color(0xFFFFEB3B);

  // ================================================================

  // Semantic aliases — maps colors to their UI role
  // ================================================================

  /// Positive/go actions (start game, new team, confirm)
  static const Color actionPositive = green;

  /// Destructive/cancel actions
  static const Color actionCancel = red;

  /// Neutral confirm actions (not as strong as positive)
  static const Color actionConfirm = orange;

  /// Team-related input fields
  static const Color teamInput = green;

  /// Opponent-related input fields
  static const Color opponentInput = red;

  /// Game rules selections
  static const Color gameRules = purple;

  /// Format selections
  static const Color gameFormat = blue;

  /// Table/data display backgrounds
  static const Color tableHighlight = yellow;
  static const Color tableData = blue;

  // ================================================================

  // Surface colors
  // ================================================================

  /// Light grey background for cards/containers
  static const Color surfaceLight = Color(0xFFEEEEEE);

  // ================================================================
}

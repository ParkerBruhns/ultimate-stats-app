import 'dart:core';
import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/style/app_colors.dart';
import 'package:ultimate_stats_app/style/style_guide.dart';
import 'package:ultimate_stats_app/models/game.dart';
import 'package:ultimate_stats_app/screens/game/widgets/starting_side_toggle.dart';

/// Game setup screen — lets the user pick a team and choose starting side
/// (offense/defense) before beginning a game.
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  /// Tracks which toggle button is selected: [offense, defense].
  /// This state lives here so setState can trigger a rebuild when it changes.
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Team selection (green) and Opponent selection (red)
            // ==========================================================
            Text("Team", style: header1TextStyle()),
            autoCompleteBox(_exampleTeams, AppColors.teamInput),
            Text("Opponent", style: header1TextStyle()),
            autoCompleteBox(_exampleOpponents, AppColors.opponentInput),
            // ==========================================================

            // Starting side toggle
            StartingSideToggle(
              isSelected: _isSelected,
              onToggle: (int index) {
                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected[i] = i == index;
                  }
                });
              },
            ),

            // Game rules (purple) and format (blue) dropdowns
            // ==========================================================
            Text("Game Rules", style: header1TextStyle()),
            gameTypesMenu(Game.gameTypesString, AppColors.gameRules),
            Text("Format", style: header1TextStyle()),
            gameTypesMenu(Game.gameFormatsString, AppColors.gameFormat),
            // ==========================================================

            // Action buttons: Cancel, Confirm, Start Game
            // ==========================================================
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton("Cancel", AppColors.actionCancel, () {
                  Navigator.pop(context);
                }),
                const SizedBox(width: 8),
                actionButton("Confirm", AppColors.actionConfirm, () {
                  // TODO: confirm game setup
                  print("Confirmed");
                }),
                const SizedBox(width: 8),
                actionButton("Start Game", AppColors.actionPositive, () {
                  // TODO: navigate to gameplay screen
                  print("Started Game");
                }),
              ],
            ),
            // ==========================================================
          ],
        ),
      ),
    );
  }
}

/// Placeholder team list for the autocomplete — will be replaced with
/// teams loaded from storage.
List<String> _exampleTeams = ["Co-Op", "Radnor", "Dub", "Colorado"];
List<String> _exampleOpponents = [
  "Swarthmore",
  "Haverford",
  "Carleton",
  "Jughandle",
];

/// Builds a dropdown menu with a colored border.
Padding gameTypesMenu(List<String> gameTypes, Color color) {
  List<DropdownMenuEntry<String>> entries = gameTypes
      .map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      })
      .toList();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownMenu(
      dropdownMenuEntries: entries,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

/// Builds an autocomplete text field with a colored border.
Padding autoCompleteBox(List<String> listElements, Color color) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Autocomplete<String>(
      optionsBuilder: (TextEditingValue teamName) {
        if (teamName.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        // Filter team names that contain the typed text
        return listElements.where((String option) {
          return option.toLowerCase().contains(teamName.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        print('Selected: $selection');
      },
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController controller,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Enter team name',
              ),
            );
          },
    ),
  );
}

/// Builds a colored action button (Cancel, Confirm, Start Game).
ElevatedButton actionButton(String label, Color color, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: Text(label),
  );
}

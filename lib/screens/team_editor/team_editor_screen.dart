import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/style/app_colors.dart';

/// Screen for editing a team's name and roster.
/// Layout matches the wireframe: purple team name field at top,
/// blue player list table below.
class TeamEditorScreen extends StatelessWidget {
  const TeamEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Editor')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Team name field (purple border)
            // ==========================================================
            const Text("Team name"),
            const SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                hintText: "My Favorite Team",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.purple, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.purple, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            // ==========================================================

            const SizedBox(height: 16),

            // Player list table (blue)
            // ==========================================================
            const Text("Player List", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // Table header
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.blue.withValues(alpha: 0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Expanded(flex: 1, child: Text("#", style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(flex: 3, child: Text("First Name", style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(flex: 3, child: Text("Last Name", style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    // Placeholder rows
                    Expanded(
                      child: ListView(
                        children: [
                          _playerRow("7", "Parker", "B"),
                          _playerRow("12", "Alex", "S"),
                          _playerRow("3", "Jordan", "K"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ==========================================================

            // Sorting controls placeholder
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _sortChip("# Jersey"),
                const SizedBox(width: 8),
                _sortChip("Last Name"),
                const SizedBox(width: 8),
                _sortChip("Points"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single row in the player table.
  static Widget _playerRow(String number, String firstName, String lastName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(number)),
          Expanded(flex: 3, child: Text(firstName)),
          Expanded(flex: 3, child: Text(lastName)),
        ],
      ),
    );
  }

  /// Builds a small sorting chip button.
  static Widget _sortChip(String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        side: BorderSide(color: AppColors.blue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, color: AppColors.blue)),
    );
  }
}

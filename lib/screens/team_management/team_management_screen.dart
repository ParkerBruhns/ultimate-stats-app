import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/style/app_colors.dart';
import 'package:ultimate_stats_app/screens/team_editor/team_editor_screen.dart';

/// Hub screen for managing teams. Displays team cards with color accents
/// and a button to create new teams.
class TeamManagementScreen extends StatelessWidget {
  const TeamManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Management')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Team cards — placeholder data, colors match wireframe
            // ==========================================================
            Expanded(
              child: ListView(
                children: [
                  _teamCard(context, "Team Name", "# Players", AppColors.green),
                  _teamCard(context, "Team Name 2", "# Players", AppColors.orange),
                  _teamCard(context, "Team Name 3", "# Players", AppColors.pink),
                  _teamCard(context, "Team Name 4", "# Players", AppColors.purple),
                ],
              ),
            ),
            // ==========================================================

            // New Team button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TeamEditorScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('New Team'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single team card row with a color accent.
  Widget _teamCard(BuildContext context, String name, String players, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(name),
        trailing: Text(players),
        tileColor: color.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeamEditorScreen()),
          );
        },
      ),
    );
  }
}

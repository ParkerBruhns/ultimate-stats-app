import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/style/app_colors.dart';
import 'package:ultimate_stats_app/screens/tournament_new/new_tournament_screen.dart';

/// Hub screen for tournaments — lets the user create a new tournament
/// or view an existing one.
///
/// Displays a tournament history table with yellow-highlighted rows
/// and action buttons at the bottom.
class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tournament')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tournament History table
            // ==========================================================
            const Text(
              "Tournament History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // Table header
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1)),
                      ),
                      child: const Row(
                        children: [
                          Expanded(flex: 2, child: Text("Team Name", style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(flex: 3, child: Text("Tournament Name", style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(flex: 1, child: Text("Standing", style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(flex: 1, child: Text("Record", style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    // Placeholder rows with yellow highlight
                    Expanded(
                      child: ListView(
                        children: [
                          _tournamentRow("Co-op", "Jaded Disc", "1/20", "3-1"),
                          _tournamentRow("Radnor HS", "FINALS, Disc.", "DNF", "2-7th"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ==========================================================

            // Action buttons
            // ==========================================================
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewTournamentScreen(),
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
                  child: const Text('New Tournament'),
                ),
              ],
            ),
            // ==========================================================
          ],
        ),
      ),
    );
  }

  /// Builds a single tournament history row with a yellow background.
  static Widget _tournamentRow(String team, String tournament, String standing, String record) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.tableHighlight.withValues(alpha: 0.3),
        border: const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(team)),
          Expanded(flex: 3, child: Text(tournament)),
          Expanded(flex: 1, child: Text(standing)),
          Expanded(flex: 1, child: Text(record)),
        ],
      ),
    );
  }
}

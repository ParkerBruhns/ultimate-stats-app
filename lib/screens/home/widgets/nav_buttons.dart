import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/style/app_colors.dart';
import 'package:ultimate_stats_app/style/style_guide.dart';
import 'package:ultimate_stats_app/screens/team_management/team_management_screen.dart';
import 'package:ultimate_stats_app/screens/game/game_screen.dart';
import 'package:ultimate_stats_app/screens/tournament/tournament_screen.dart';
import 'package:ultimate_stats_app/screens/settings/settings_screen.dart';

// Home screen navigation buttons
// ================================================================
// Each button is a full-width ElevatedButton that pushes a new screen
// onto the Navigator stack when pressed. Colors match the wireframe:
// green (Team Management), orange (Start Game), purple (Tournament),
// pink (Settings).
// ================================================================

/// Navigates to the Team Management screen.
class TeamManagementButton extends StatelessWidget {
  const TeamManagementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeamManagementScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.white,
        ),
        child: Text("Team Management", style: header2TextStyle().copyWith(color: Colors.white)),
      ),
    );
  }
}

/// Navigates to the Game setup screen.
class StartGameButton extends StatelessWidget {
  const StartGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GameScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          foregroundColor: Colors.white,
        ),
        child: Text("Start Game", style: header2TextStyle().copyWith(color: Colors.white)),
      ),
    );
  }
}

/// Navigates to the Tournament hub screen.
class StartTournamentButton extends StatelessWidget {
  const StartTournamentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TournamentScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purple,
          foregroundColor: Colors.white,
        ),
        child: Text("Start Tournament", style: header2TextStyle().copyWith(color: Colors.white)),
      ),
    );
  }
}

/// Navigates to the Settings screen.
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink,
          foregroundColor: Colors.white,
        ),
        child: Text("Settings", style: header2TextStyle().copyWith(color: Colors.white)),
      ),
    );
  }
}

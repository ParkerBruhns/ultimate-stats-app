import 'package:flutter/material.dart';
import '../../../style/style_guide.dart';

import '../../team_management/team_management_screen.dart';
import '../../game/game_screen.dart';
import '../../tournament/tournament_screen.dart';
import '../../settings/settings_screen.dart';

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
        style: buttonStyle(),
        child: Text("Team Management", style: header2TextStyle()),
      ),
    );
  }
}

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
            MaterialPageRoute(
              builder: (context) => const GameScreen(),
            ),
          );
        },
        child: Text("Start Game", style: header2TextStyle()),
      ),
    );
  }
}

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
            MaterialPageRoute(
              builder: (context) => const TournamentScreen(),
            ),
          );
        },
        child: Text("Start Tournament", style: header2TextStyle()),
      ),
    );
  }
}

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
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          );
        },
        child: Text("Settings", style: header2TextStyle()),
      ),
    );
  }
}

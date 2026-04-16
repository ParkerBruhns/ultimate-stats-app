import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/screens/home/widgets/games_history.dart';
import 'package:ultimate_stats_app/screens/home/widgets/nav_buttons.dart';

/// The main landing screen of the app.
///
/// Displays a 2x2 grid of navigation buttons at the top and a scrollable
/// games history list below.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ultimate Stats'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Navigation buttons grid
              // ============================================================
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  NavButtonAlignment(child: TeamManagementButton()),
                  NavButtonAlignment(child: StartGameButton()),
                  NavButtonAlignment(child: StartTournamentButton()),
                  NavButtonAlignment(child: SettingsButton()),
                ],
              ),
              // ============================================================

              // Games history list (fills remaining space)
              Expanded(child: GamesHistory()),
            ],
          ),
        ),
      ),
    );
  }
}

/// Wrapper widget that centers and pads a navigation button within a grid cell.
class NavButtonAlignment extends StatelessWidget {
  const NavButtonAlignment({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(padding: const EdgeInsets.all(4), child: child),
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/games_history.dart';
import 'widgets/nav_buttons.dart';

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
              Expanded(child: GamesHistory()),
            ],
          ),
        ),
      ),
    );
  }
}

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

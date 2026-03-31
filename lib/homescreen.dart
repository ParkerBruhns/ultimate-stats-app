import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ultimate Stats'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to Ultimate Stats!'),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: const TeamManagementButton(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: const StartGameButton(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: const StartTournamentButton(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: const SettingsButton(),
                    ),
                  ),
                ],
              ),
              Expanded(child: const GamesHistory()),
            ],
          ),
        ),
      ),
    );
  }
}

class GamesHistory extends StatelessWidget {
  const GamesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(leading: Icon(Icons.man), title: Text("ManIcon")),
        ListTile(leading: Icon(Icons.icecream), title: Text("Icecream Icon")),
      ],
    );
  }
}

class TeamManagementButton extends StatelessWidget {
  const TeamManagementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: const Text("Team Management"),
      style: buttonStyle(),
    );
  }

  void _onPressed() {
    print("Team Button Pressed");
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _onPressed, child: const Text("Settings"));
  }

  void _onPressed() {
    print("Settings Button Pressed");
  }
}

class StartTournamentButton extends StatelessWidget {
  const StartTournamentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: const Text("Start Tournament"),
    );
  }

  void _onPressed() {
    print("Start Tournament Button Pressed");
  }
}

class StartGameButton extends StatelessWidget {
  const StartGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: const Text("Start Game"),
    );
  }

  void _onPressed() {
    print("Start Game Button Pressed");
  }
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    ),
  );
}

import 'package:flutter/material.dart';
import '../team_editor/team_editor_screen.dart';

class TeamManagementScreen extends StatelessWidget {
  const TeamManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Management')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeamEditorScreen(),
              ),
            );
          },
          child: const Text('Edit Team'),
        ),
      ),
    );
  }
}

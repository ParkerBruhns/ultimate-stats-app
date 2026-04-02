import 'package:flutter/material.dart';
import '../tournament_new/new_tournament_screen.dart';
import '../tournament_view/tournament_view_screen.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tournament')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              child: const Text('New Tournament'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TournamentViewScreen(),
                  ),
                );
              },
              child: const Text('View Tournament'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewTournamentScreen extends StatelessWidget {
  const NewTournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Tournament')),
      body: const Center(
        child: Text('New Tournament Screen'),
      ),
    );
  }
}

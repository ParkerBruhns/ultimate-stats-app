import 'package:flutter/material.dart';

class TournamentViewScreen extends StatelessWidget {
  const TournamentViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tournament View')),
      body: const Center(
        child: Text('Tournament View Screen'),
      ),
    );
  }
}

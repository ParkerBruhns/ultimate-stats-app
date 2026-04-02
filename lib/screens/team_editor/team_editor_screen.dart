import 'package:flutter/material.dart';

class TeamEditorScreen extends StatelessWidget {
  const TeamEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Editor')),
      body: const Center(
        child: Text('Team Editor Screen'),
      ),
    );
  }
}

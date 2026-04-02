import 'package:flutter/material.dart';
import '../../../style/style_guide.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // This state lives here so setState can trigger a rebuild when it changes
  List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Team", style: header1TextStyle()),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue teamName) {
                if (teamName.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _exampleTeams.where((String option) {
                  return option.toLowerCase().contains(teamName.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                print('Selected: $selection');
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController controller,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter team name',
                  ),
                );
              },
            ),
            Text("Starting On", style: header1TextStyle()),
            Row(
              children: [
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      // Toggle the tapped button, untoggle the other
                      for (int i = 0; i < _isSelected.length; i++) {
                        _isSelected[i] = i == index;
                      }
                    });
                  },
                  isSelected: _isSelected,
                  children: [
                    Text("Offense", style: header2TextStyle()),
                    Text("Defense", style: header2TextStyle()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _exampleTeams = ["Co-Op", "Radnor", "Dub", "Colorado"];

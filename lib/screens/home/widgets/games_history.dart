import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/style/app_colors.dart';

/// Placeholder: number of teams (will be replaced with real data).
int numTeams = 4;

/// Displays a scrollable list of past games on the home screen.
///
/// Currently populated with placeholder data — will eventually pull
/// from stored game records. Each row is color-coded to match the
/// wireframe's game history style.
class GamesHistory extends StatelessWidget {
  const GamesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(width: 3.0),
      ),
      child: Column(
        children: [
          // Section header
          Title(
            child: Text("Games History", style: TextStyle(fontSize: 16.0)),
            color: Color(0xff000000),
          ),

          // Scrollable list of game entries — colors cycle through the palette
          Expanded(
            child: ListView(
              children: <Widget>[
                gameConstructor(Icons.add_box, "My Team vs Other Team 1 | 13-8", AppColors.yellow, imagePath: "lib/assets/goldenRamLogo.png"),
                gameConstructor(Icons.abc, "My Team vs Other Team 2 | 15-11", AppColors.orange),
                gameConstructor(Icons.star, "My Team vs Other Team 3 | 5-8", AppColors.red),
                gameConstructor(Icons.star, "My Team vs Other Team 4 | 12-10", AppColors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Builds a single game history list tile with a color accent.
/// This is a placeholder — will be replaced with real game data widgets.
///
/// If [imagePath] is provided, the tile shows that image as its leading
/// visual; otherwise it falls back to [icon] tinted against [color].
Container gameConstructor(IconData? icon, String text, Color color, {String? imagePath}) {
  return Container(
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.3),
      border: Border.all(width: 0.5),
    ),
    child: ListTile(
      leading: imagePath != null
          ? Image.asset(imagePath, width: 40, height: 40)
          : Icon(icon, color: Color.lerp(color, Colors.black, 0.15)),
      title: Text(text),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
      contentPadding: EdgeInsets.all(5.0),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/style/app_colors.dart';
import 'package:ultimate_stats_app/style/style_guide.dart';

/// A toggle widget for selecting the starting side (Offense or Defense).
///
/// Uses two side-by-side rounded buttons that highlight the selected option.
/// The parent must provide [isSelected] state and an [onToggle] callback
/// so that setState happens in the parent and triggers a rebuild.
class StartingSideToggle extends StatelessWidget {
  const StartingSideToggle({
    super.key,
    required this.isSelected,
    required this.onToggle,
  });

  /// Two-element list: [offenseSelected, defenseSelected].
  final List<bool> isSelected;

  /// Called with the index (0 = offense, 1 = defense) when a button is tapped.
  final void Function(int index) onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Starting On", style: header1TextStyle()),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildToggleButton("Offense", 0),
            const SizedBox(width: 12),
            _buildToggleButton("Defense", 1),
          ],
        ),
      ],
    );
  }

  /// Builds a single toggle button that fills/outlines based on selection.
  Widget _buildToggleButton(String label, int index) {
    final bool selected = isSelected[index];

    return ElevatedButton(
      onPressed: () => onToggle(index),
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? AppColors.purple : Colors.white,
        foregroundColor: selected ? Colors.white : AppColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.purple),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(label, style: header2TextStyle().copyWith(
        color: selected ? Colors.white : AppColors.purple,
      )),
    );
  }
}

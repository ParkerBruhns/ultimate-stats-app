import 'package:ultimate_stats_app/models/game_stats.dart';

/// Represents a single player on a team.
class Player {
  Player(this.teamId, this.jerseyNumber, this.firstName, this.lastName);

  // Identity
  // ================================================================
  int teamId;
  int jerseyNumber;
  String firstName;
  String lastName;
  // ================================================================

  // Statistics
  // ================================================================
  /// Aggregates this player's stats from a specific game's [GameStats].
  void getStatsFromGameStats(GameStats game) {
    // TODO: pull cumulative stats from individual game stat lines
  }
  // ================================================================
}

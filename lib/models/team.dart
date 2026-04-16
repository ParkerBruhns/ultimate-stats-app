import 'package:ultimate_stats_app/models/player.dart';

/// Represents a team and its roster of players.
class Team {
  Team(this.teamId, this.teamName, this.players);

  // Identity
  // ================================================================
  int teamId;
  String teamName;
  // ================================================================

  // Roster
  // ================================================================
  /// Maps jersey number -> Player for quick lookups.
  Map<int, Player> players;

  /// Adds a player to the roster, keyed by jersey number.
  /// Overwrites any existing player with the same jersey number.
  void addPlayer(Player player) {
    players[player.jerseyNumber] = player;
  }

  /// Removes a player from the roster by jersey number.
  void removePlayer(Player player) {
    players.remove(player.jerseyNumber);
  }

  // ================================================================
}

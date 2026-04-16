import 'package:ultimate_stats_app/models/game.dart';

/// Represents a tournament containing multiple games.
class Tournament {
  Tournament(this.tournamentId, this.games);

  // Identity
  // ================================================================
  int tournamentId;
  // ================================================================

  // Games
  // ================================================================
  /// Maps game ID -> Game for all games in this tournament.
  Map<int, Game> games;

  /// Adds a game to the tournament, keyed by its game ID.
  /// Overwrites any existing game with the same ID.
  void addGame(Game game) {
    games[game.gameId] = game;
  }

  // ================================================================
}

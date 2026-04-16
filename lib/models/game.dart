import 'package:ultimate_stats_app/models/team.dart';

/// The possible phases a game can be in.
enum GameState { stopped, timeout, halftime, offense, defense }

enum GameTypes {
  indoor("Indoor"),
  outdoor("Outdoor"),
  beach("Beach");

  final String type;

  const GameTypes(this.type);

  @override
  String toString() {
    return type;
  }
}

enum GameFormat {
  same7v7("Same 7v7"),
  same6v6("Same 6v6"),
  same5v5("Same 5v5"),
  same4v4("Same 4v4"),
  same3v3("Same 3v3"),
  mixed7v7("Mixed 7v7"),
  mixed6v6("Mixed 6v6"),
  mixed5v5("Mixed 5v5"),
  mixed4v4("Mixed 4v4"),
  mixed3v3("Mixed 3v3");

  final String format;

  const GameFormat(this.format);

  @override
  String toString() {
    return format;
  }
}

/// Represents a single game between a team and an opponent.
class Game {
  Game(this.gameId, this.team, this.opponent);

  // Identity
  // ================================================================
  int gameId;
  Team team;
  Opponent opponent;
  // ================================================================

  // Game state
  // ================================================================
  int teamScore = 0;
  int opponentScore = 0;

  /// Tracks the current phase of the game (stopped, offense, defense, etc.).
  GameState gameState = GameState.stopped;
  // ================================================================
  static List<String> gameTypesString = [
    GameTypes.indoor.toString(),
    GameTypes.outdoor.toString(),
    GameTypes.beach.toString(),
  ];

  static List<String> gameFormatsString = [
    GameFormat.same7v7.toString(),
    GameFormat.same6v6.toString(),
    GameFormat.same5v5.toString(),
    GameFormat.same4v4.toString(),
    GameFormat.same3v3.toString(),
    GameFormat.mixed7v7.toString(),
    GameFormat.mixed6v6.toString(),
    GameFormat.mixed5v5.toString(),
    GameFormat.mixed4v4.toString(),
    GameFormat.mixed3v3.toString(),
  ];
}

/// Represents the opposing team in a game.
/// Kept separate from [Team] since opponents don't need a full roster.
class Opponent {
  Opponent(this.opponentId, this.opponentName);

  int opponentId;
  String opponentName;
}

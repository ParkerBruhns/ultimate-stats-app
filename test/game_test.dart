import 'package:test/test.dart';
import 'package:ultimate_stats_app/models/game.dart';
import 'package:ultimate_stats_app/models/team.dart';

void main() {
  group('Game', () {
    test('initializes with zero scores and stopped state', () {
      final team = Team(1, "Co-Op", {});
      final opponent = Opponent(1, "Rival");
      final game = Game(1, team, opponent);

      expect(game.teamScore, 0);
      expect(game.opponentScore, 0);
      expect(game.gameState, GameState.stopped);
    });

    test('stores team and opponent', () {
      final team = Team(1, "Co-Op", {});
      final opponent = Opponent(2, "Stack");
      final game = Game(1, team, opponent);

      expect(game.team.teamName, "Co-Op");
      expect(game.opponent.opponentName, "Stack");
    });
  });

  group('Opponent', () {
    test('stores id and name', () {
      final opponent = Opponent(5, "Rival");
      expect(opponent.opponentId, 5);
      expect(opponent.opponentName, "Rival");
    });
  });

  group('GameState enum', () {
    test('has all expected values', () {
      expect(GameState.values, containsAll([
        GameState.stopped,
        GameState.timeout,
        GameState.halftime,
        GameState.offense,
        GameState.defense,
      ]));
    });
  });
}

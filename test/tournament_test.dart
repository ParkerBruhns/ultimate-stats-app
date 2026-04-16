import 'package:test/test.dart';
import 'package:ultimate_stats_app/models/game.dart';
import 'package:ultimate_stats_app/models/team.dart';
import 'package:ultimate_stats_app/models/tournament.dart';

void main() {
  group('Tournament', () {
    late Team team;
    late Opponent opponent;

    setUp(() {
      team = Team(1, "Co-Op", {});
      opponent = Opponent(1, "Rival");
    });

    test('addGame adds a game to the map', () {
      final tournament = Tournament(1, {});
      final game = Game(10, team, opponent);
      tournament.addGame(game);

      expect(tournament.games.containsKey(10), true);
      expect(tournament.games[10]?.team.teamName, "Co-Op");
    });

    test('add multiple games', () {
      final tournament = Tournament(1, {});
      final game1 = Game(1, team, opponent);
      final game2 = Game(2, team, Opponent(2, "Stack"));
      tournament.addGame(game1);
      tournament.addGame(game2);

      expect(tournament.games.length, 2);
    });

    test('adding game with same id overwrites', () {
      final tournament = Tournament(1, {});
      final game1 = Game(1, team, Opponent(1, "Rival"));
      final game2 = Game(1, team, Opponent(2, "Stack"));
      tournament.addGame(game1);
      tournament.addGame(game2);

      expect(tournament.games.length, 1);
      expect(tournament.games[1]?.opponent.opponentName, "Stack");
    });
  });
}

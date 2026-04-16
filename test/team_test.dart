import 'package:test/test.dart';
import 'package:ultimate_stats_app/models/player.dart';
import 'package:ultimate_stats_app/models/team.dart';

void main() {
  group('Team', () {
    test('add player to the map', () {
      final team = Team(1, "Co-Op", {});
      final player = Player(1, 7, "John", "Smith");
      team.addPlayer(player);

      expect(team.players.containsKey(7), true);
      expect(team.players[7]?.firstName, "John");
    });

    test('remove players from the map', () {
      final player = Player(1, 7, "Parker", "Bruhns");
      final team = Team(1, "Radnor", {7: player});
      team.removePlayer(player);

      expect(team.players.containsKey(7), false);
    });

    test('add multiple players', () {
      final team = Team(1, "Stack", {});
      final p1 = Player(1, 1, "Alice", "A");
      final p2 = Player(1, 22, "Bob", "B");
      team.addPlayer(p1);
      team.addPlayer(p2);

      expect(team.players.length, 2);
      expect(team.players[1]?.firstName, "Alice");
      expect(team.players[22]?.firstName, "Bob");
    });

    test('adding player with same jersey number overwrites', () {
      final team = Team(1, "Stack", {});
      final p1 = Player(1, 7, "Alice", "A");
      final p2 = Player(1, 7, "Bob", "B");
      team.addPlayer(p1);
      team.addPlayer(p2);

      expect(team.players.length, 1);
      expect(team.players[7]?.firstName, "Bob");
    });
  });
}

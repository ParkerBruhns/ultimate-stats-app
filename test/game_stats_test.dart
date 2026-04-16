import 'package:test/test.dart';
import 'package:ultimate_stats_app/models/game_stats.dart';

void main() {
  late GameStats stats;

  setUp(() {
    stats = GameStats(1, 100);
  });

  group('threw', () {
    test('increments totalThrows', () {
      stats.threw(20, true);
      expect(stats.totalThrows, 1);
    });

    test('completed throw increments completions and yards', () {
      stats.threw(25, true);
      expect(stats.completions, 1);
      expect(stats.totalThrowingYards, 25);
    });

    test('incomplete throw does not increment completions or yards', () {
      stats.threw(25, false);
      expect(stats.totalThrows, 1);
      expect(stats.completions, 0);
      expect(stats.totalThrowingYards, 0);
    });

    test('huck attempt tracked at 40+ yards', () {
      stats.threw(40, false);
      expect(stats.huckAttempts, 1);
      expect(stats.huckCompletions, 0);
    });

    test('completed huck tracked at 40+ yards', () {
      stats.threw(45, true);
      expect(stats.huckAttempts, 1);
      expect(stats.huckCompletions, 1);
    });

    test('short throw is not a huck', () {
      stats.threw(39, true);
      expect(stats.huckAttempts, 0);
      expect(stats.huckCompletions, 0);
    });
  });

  group('caught', () {
    test('increments catches and targets', () {
      stats.caught(15);
      expect(stats.totalCatches, 1);
      expect(stats.totalTargets, 1);
    });

    test('adds receiving yards', () {
      stats.caught(30);
      expect(stats.totalReceivingYards, 30);
    });
  });

  group('dropped', () {
    test('increments targets but not catches', () {
      stats.dropped();
      expect(stats.totalTargets, 1);
      expect(stats.totalCatches, 0);
    });
  });

  group('goal', () {
    test('increments points, catches, targets, and receiving yards', () {
      stats.goal(10);
      expect(stats.points, 1);
      expect(stats.totalCatches, 1);
      expect(stats.totalTargets, 1);
      expect(stats.totalReceivingYards, 10);
    });

    test('multiple goals accumulate', () {
      stats.goal(10);
      stats.goal(5);
      expect(stats.points, 2);
      expect(stats.totalCatches, 2);
      expect(stats.totalReceivingYards, 15);
    });
  });

  group('assist', () {
    test('increments assists, throws, completions, and yards', () {
      stats.assist(20);
      expect(stats.assists, 1);
      expect(stats.totalThrows, 1);
      expect(stats.completions, 1);
      expect(stats.totalThrowingYards, 20);
    });

    test('long assist counts as huck', () {
      stats.assist(50);
      expect(stats.huckAttempts, 1);
      expect(stats.huckCompletions, 1);
    });

    test('short assist is not a huck', () {
      stats.assist(30);
      expect(stats.huckAttempts, 0);
    });
  });

  group('block', () {
    test('increments blocks', () {
      stats.block();
      stats.block();
      expect(stats.blocks, 2);
    });
  });

  group('getTurnovers', () {
    test('returns difference between throws and completions', () {
      stats.threw(20, true);
      stats.threw(15, false);
      stats.threw(30, true);
      stats.threw(10, false);
      expect(stats.getTurnovers(), 2);
    });

    test('returns zero when all throws completed', () {
      stats.threw(20, true);
      stats.threw(15, true);
      expect(stats.getTurnovers(), 0);
    });
  });

  group('percentage methods', () {
    test('getThrowingPercentage with no throws returns 0.0', () {
      expect(stats.getThrowingPercentage(), 0.0);
    });

    test('getThrowingPercentage calculates correctly', () {
      stats.threw(20, true);
      stats.threw(15, false);
      stats.threw(30, true);
      expect(stats.getThrowingPercentage(), closeTo(0.6667, 0.001));
    });

    test('getCatchingPercentage with no targets returns 0.0', () {
      expect(stats.getCatchingPercentage(), 0.0);
    });

    test('getCatchingPercentage calculates correctly', () {
      stats.caught(10);
      stats.caught(20);
      stats.dropped();
      expect(stats.getCatchingPercentage(), closeTo(0.6667, 0.001));
    });

    test('getHuckPercentage with no huck attempts returns 0.0', () {
      expect(stats.getHuckPercentage(), 0.0);
    });

    test('getHuckPercentage calculates correctly', () {
      stats.threw(50, true);
      stats.threw(45, false);
      expect(stats.getHuckPercentage(), 0.5);
    });
  });

  group('combined scenarios', () {
    test('full game simulation', () {
      // Player catches a few, scores once, throws some, gets an assist
      stats.caught(15);
      stats.caught(20);
      stats.dropped();
      stats.goal(10);
      stats.threw(25, true);
      stats.threw(30, false);
      stats.assist(50);
      stats.block();

      expect(stats.points, 1);
      expect(stats.assists, 1);
      expect(stats.totalCatches, 3);
      expect(stats.totalTargets, 4);
      expect(stats.totalThrows, 3);
      expect(stats.completions, 2);
      expect(stats.totalReceivingYards, 45);
      expect(stats.totalThrowingYards, 75);
      expect(stats.huckAttempts, 1);
      expect(stats.huckCompletions, 1);
      expect(stats.blocks, 1);
      expect(stats.getTurnovers(), 1);
    });
  });
}

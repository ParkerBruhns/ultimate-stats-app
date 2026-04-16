/// Tracks all statistics for a single player in a single game.
///
/// Stats are recorded via event methods (threw, caught, etc.) called during
/// gameplay, and derived stats (percentages, turnovers) are computed on demand.
class GameStats {
  GameStats(this.playerId, this.gameId);

  // Identity
  // ================================================================
  int playerId;
  int gameId;
  // ================================================================

  // Offensive throwing stats
  // ================================================================
  int totalThrows = 0;
  int completions = 0;
  int assists = 0;
  int huckAttempts = 0;
  int huckCompletions = 0;
  int totalThrowingYards = 0;
  // ================================================================

  // Offensive receiving stats
  // ================================================================
  int totalTargets = 0;
  int totalCatches = 0;
  int points = 0;
  int totalReceivingYards = 0;
  // ================================================================

  // Defensive stats
  // ================================================================
  int blocks = 0;
  // ================================================================

  // Gametime event methods
  // ================================================================

  /// Records a throw attempt.
  /// [distance] is the throw length in yards.
  /// [completed] indicates whether the receiver caught it.
  /// Throws of 40+ yards are tracked as hucks.
  void threw(int distance, bool completed) {
    totalThrows++;
    if (distance >= 40) {
      huckAttempts++;
      if (completed) {
        huckCompletions++;
      }
    }

    if (completed) {
      completions++;
      totalThrowingYards += distance;
    }
  }

  /// Records a drop — the player was targeted but did not catch it.
  void dropped() {
    totalTargets++;
  }

  /// Records a successful catch.
  /// [distance] is the length of the throw the player received.
  void caught(int distance) {
    totalCatches++;
    totalTargets++;
    totalReceivingYards += distance;
  }

  /// Records a goal scored by this player (catch in the end zone).
  /// Also counts as a catch and a target.
  void goal(int distance) {
    totalCatches++;
    totalTargets++;
    totalReceivingYards += distance;
    points++;
  }

  /// Records an assist — a completed throw that led to a goal.
  /// Also counts as a completed throw and adds yardage.
  void assist(int distance) {
    totalThrows++;
    totalThrowingYards += distance;

    if (distance >= 40) {
      huckAttempts++;
      huckCompletions++;
    }

    completions++;
    assists++;
  }

  /// Records a defensive block (knockdown or interception).
  void block() {
    blocks++;
  }

  // ================================================================
  // End of gametime event methods

  // Derived statistics
  // ================================================================

  /// Returns the number of incomplete throws (totalThrows - completions).
  int getTurnovers() => totalThrows - completions;

  /// Returns the ratio of completed throws to total throws.
  /// Returns 0.0 if no throws have been attempted.
  double getThrowingPercentage() {
    if (totalThrows == 0) return 0.0;
    return completions / totalThrows.toDouble();
  }

  /// Returns the ratio of catches to total targets.
  /// Returns 0.0 if the player has not been targeted.
  double getCatchingPercentage() {
    if (totalTargets == 0) return 0.0;
    return totalCatches / totalTargets.toDouble();
  }

  /// Returns the ratio of completed hucks to huck attempts.
  /// Returns 0.0 if no hucks have been attempted.
  double getHuckPercentage() {
    if (huckAttempts == 0) return 0.0;
    return huckCompletions / huckAttempts.toDouble();
  }

  // ================================================================
  // End of derived statistics
}

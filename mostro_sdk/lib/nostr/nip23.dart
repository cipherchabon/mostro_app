/// Set of conditions of a delegation.
typedef Conditions = Set<Condition>;

/// A condition from the delegation conditions.
sealed class Condition {
  const Condition();
}

/// Event kind, e.g. kind=1
class Kind extends Condition {
  final int kind;
  const Kind(this.kind);
}

/// Creation time before, e.g. created_at<1679000000
class CreatedBefore extends Condition {
  final int createdBefore;
  const CreatedBefore(this.createdBefore);
}

/// Creation time after, e.g. created_at>1676000000
class CreatedAfter extends Condition {
  final int createdAfter;
  const CreatedAfter(this.createdAfter);
}

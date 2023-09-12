/// Market
sealed class Market {
  const Market();
}

/// Root
class Root extends Market {
  const Root();
}

/// Reply
class Reply extends Market {
  const Reply();
}

/// Custom
class Custom extends Market {
  final String market;
  const Custom(this.market);
}

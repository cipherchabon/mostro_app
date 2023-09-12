typedef SubscriptionId = String;
typedef EventId = String;

/// Messages sent by relays, received by clients
sealed class RelayMessage {
  const RelayMessage();
}

class Event extends RelayMessage {
  final SubscriptionId subscriptionId;
  final Event event;

  const Event(this.subscriptionId, this.event);
}

class Notice extends RelayMessage {
  final String message;

  const Notice(this.message);
}

class EndOfStoredEvents extends RelayMessage {
  final SubscriptionId subscriptionId;

  const EndOfStoredEvents(this.subscriptionId);
}

class Ok extends RelayMessage {
  final EventId eventId;
  final bool status;
  final String message;

  const Ok(this.eventId, this.status, this.message);
}

class Auth extends RelayMessage {
  final String challenge;

  const Auth(this.challenge);
}

class Empty extends RelayMessage {
  const Empty();
}

import 'message.dart';

/// Relay Pool Message
sealed class RelayPoolMessage {
  const RelayPoolMessage();
}

/// Received new message
class ReceivedMsg extends RelayPoolMessage {
  final Uri relayUrl;
  final RelayMessage msg;

  const ReceivedMsg(this.relayUrl, this.msg);
}

/// Event sent
class EventSent extends RelayPoolMessage {
  final Event event;

  const EventSent(this.event);
}

/// Shutdown
class Shutdown extends RelayPoolMessage {
  const Shutdown();
}

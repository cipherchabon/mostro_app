import '../message/client.dart';

/// Relay event
sealed class RelayEvent {
  const RelayEvent();
}

/// Send [`ClientMessage`]
class SendMsg extends RelayEvent {
  final ClientMessage message;

  const SendMsg(this.message);
}

/// Close
class Close extends RelayEvent {
  const Close();
}

/// Completly disconnect
class Terminate extends RelayEvent {
  const Terminate();
}

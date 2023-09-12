// /// Messages sent by clients, received by relays
// #[allow(missing_docs)]
// #[derive(Debug, Clone, Eq, PartialEq)]
// pub enum ClientMessage {
//     /// Event
//     Event(Box<Event>),
//     /// Req
//     Req {
//         subscription_id: SubscriptionId,
//         filters: Vec<Filter>,
//     },
//     /// Close
//     Close(SubscriptionId),
//     /// Auth
//     Auth(Box<Event>),
// }

import '../relay/message.dart';
import 'subcription.dart';

/// Messages sent by clients, received by relays
sealed class ClientMessage {
  const ClientMessage();
}

/// Event
class Event extends ClientMessage {
  final SubscriptionId subscriptionId;
  final Event event;

  const Event(this.subscriptionId, this.event);
}

/// Req
class Req extends ClientMessage {
  final SubscriptionId subscriptionId;
  final List<Filter> filters;

  const Req(this.subscriptionId, this.filters);
}

/// Close
class Close extends ClientMessage {
  final SubscriptionId subscriptionId;

  const Close(this.subscriptionId);
}

/// Auth
class Auth extends ClientMessage {
  final Event event;

  const Auth(this.event);
}

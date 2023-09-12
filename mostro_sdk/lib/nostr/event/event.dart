import 'package:mostro_sdk/common.dart';
import 'package:mostro_sdk/nostr/event/errors.dart';
import 'package:mostro_sdk/nostr/relay/message.dart';
import 'package:mostro_sdk/nostr/signature.dart';

import '../tag/tag.dart';
import '../x_only_pk.dart';
import 'kind.dart';

class Event {
  /// Id
  final EventId id;

  /// Author
  final XOnlyPublicKey pubkey;

  /// Timestamp (seconds)
  final int createdAt;

  /// Kind
  final Kind kind;

  /// Vector of [`Tag`]
  final List<Tag> tags;

  /// Content
  final String content;

  /// Signature
  final Signature sig;

  /// OpenTimestamps Attestations
  final String? ots;

  const Event({
    required this.id,
    required this.pubkey,
    required this.createdAt,
    required this.kind,
    required this.tags,
    required this.content,
    required this.sig,
    this.ots,
  });

  /// Verify event
  Result<void, EventError> verify() {
    throw UnimplementedError();
  }
}

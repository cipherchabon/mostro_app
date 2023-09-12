import 'package:mostro_sdk/nostr/relay/message.dart';

import '../event/kind.dart' show Kind;
import '../nip23.dart' show Condition;
import '../signature.dart';
import '../x_only_pk.dart';
import 'report.dart';
import 'tag_kind.dart';

sealed class Tag {
  const Tag();
}

class Generic extends Tag {
  final TagKind kind;
  final List<String> values;
  const Generic(this.kind, this.values);
}

class Event extends Tag {
  final EventId eventId;
  final String? value;
  final String? marker;

  const Event(
    this.eventId, {
    this.value,
    this.marker,
  });
}

class PubKey extends Tag {
  final XOnlyPublicKey publicKey;
  final String? value;

  const PubKey(
    this.publicKey, {
    this.value,
  });
}

class EventReport extends Tag {
  final EventId eventId;
  final Report report;

  const EventReport(
    this.eventId,
    this.report,
  );
}

class PubKeyReport extends Tag {
  final XOnlyPublicKey publicKey;
  final Report report;

  const PubKeyReport(
    this.publicKey,
    this.report,
  );
}

class Reference extends Tag {
  final String reference;

  const Reference(
    this.reference,
  );
}

class RelayMetadata extends Tag {
  final String value;
  final String? optional;

  const RelayMetadata(
    this.value, [
    this.optional,
  ]);
}

class Hashtag extends Tag {
  final String hashtag;

  const Hashtag(
    this.hashtag,
  );
}

class Geohash extends Tag {
  final String geohash;

  const Geohash(
    this.geohash,
  );
}

class Identifier extends Tag {
  final String identifier;

  const Identifier(
    this.identifier,
  );
}

class A extends Tag {
  final Kind kind;
  final XOnlyPublicKey publicKey;
  final String identifier;
  final String relayUrl;

  const A(
    this.kind,
    this.publicKey,
    this.identifier,
    this.relayUrl,
  );
}

class Relay extends Tag {
  final Uri uri;

  const Relay(
    this.uri,
  );
}

class ContactList extends Tag {
  final XOnlyPublicKey publicKey;
  final String? relayUrl;
  final String? alias;

  const ContactList(
    this.publicKey, {
    this.relayUrl,
    this.alias,
  });
}

class Pow extends Tag {
  final int nonce;
  final int difficulty;

  const Pow(
    this.nonce,
    this.difficulty,
  );
}

class Delegation extends Tag {
  final XOnlyPublicKey delegatorPk;
  final Set<Condition> conditions;
  final Signature signature;

  const Delegation(
    this.delegatorPk,
    this.conditions,
    this.signature,
  );
}

class ContentWarning extends Tag {
  final String? reason;

  const ContentWarning({
    this.reason,
  });
}

class Expiration extends Tag {
  final int timestamp;

  const Expiration(
    this.timestamp,
  );
}

class Subject extends Tag {
  final String subject;

  const Subject(
    this.subject,
  );
}

class Challenge extends Tag {
  final String challenge;

  const Challenge(
    this.challenge,
  );
}

class Title extends Tag {
  final String title;

  const Title(
    this.title,
  );
}

class Image extends Tag {
  final String image;

  const Image(
    this.image,
  );
}

class Summary extends Tag {
  final String summary;

  const Summary(
    this.summary,
  );
}

class Description extends Tag {
  final String description;

  const Description(
    this.description,
  );
}

class Bolt11 extends Tag {
  final String bolt11;

  const Bolt11(
    this.bolt11,
  );
}

class Preimage extends Tag {
  final String preimage;

  const Preimage(
    this.preimage,
  );
}

class Relays extends Tag {
  final List<Uri> relays;

  const Relays(
    this.relays,
  );
}

class Amount extends Tag {
  final int amount;

  const Amount(
    this.amount,
  );
}

class PublishedAt extends Tag {
  final int timestamp;

  const PublishedAt(
    this.timestamp,
  );
}

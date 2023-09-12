import '../event/kind.dart';
import '../relay/message.dart';
import '../x_only_pk.dart';

class Filter {
  final List<String>? ids;
  final List<XOnlyPublicKey>? authors;
  final List<Kind>? kinds;
  final List<EventId>? events;
  final List<XOnlyPublicKey>? pubkeys;
  final List<String>? hashtags;
  final List<String>? references;
  final String? search;
  final int? since;
  final int? until;
  final int? limit;
  final Map<String, dynamic>? custom;

  const Filter({
    this.ids,
    this.authors,
    this.kinds,
    this.events,
    this.pubkeys,
    this.hashtags,
    this.references,
    this.search,
    this.since,
    this.until,
    this.limit,
    this.custom,
  });
}

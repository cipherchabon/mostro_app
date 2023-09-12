/// Tag kind
sealed class TagKind {
  const TagKind();
}

/// Public key
class P extends TagKind {
  const P();
}

/// Event id
class E extends TagKind {
  const E();
}

/// Reference (URL, etc.)
class R extends TagKind {
  const R();
}

/// Hashtag
class T extends TagKind {
  const T();
}

/// Geohash
class G extends TagKind {
  const G();
}

/// Identifier
class D extends TagKind {
  const D();
}

/// Referencing and tagging
class A extends TagKind {
  const A();
}

/// Relay
class Relay extends TagKind {
  const Relay();
}

/// Nonce
class Nonce extends TagKind {
  const Nonce();
}

/// Delegation
class Delegation extends TagKind {
  const Delegation();
}

/// Content warning
class ContentWarning extends TagKind {
  const ContentWarning();
}

/// Expiration
class Expiration extends TagKind {
  const Expiration();
}

/// Subject
class Subject extends TagKind {
  const Subject();
}

/// Auth challenge
class Challenge extends TagKind {
  const Challenge();
}

/// Title (NIP23)
class Title extends TagKind {
  const Title();
}

/// Image (NIP23)
class Image extends TagKind {
  const Image();
}

/// Summary (NIP23)
class Summary extends TagKind {
  const Summary();
}

/// PublishedAt (NIP23)
class PublishedAt extends TagKind {
  const PublishedAt();
}

/// Description (NIP57)
class Description extends TagKind {
  const Description();
}

/// Bolt11 Invoice (NIP57)
class Bolt11 extends TagKind {
  const Bolt11();
}

/// Preimage (NIP57)
class Preimage extends TagKind {
  const Preimage();
}

/// Relays (NIP57)
class Relays extends TagKind {
  const Relays();
}

/// Amount (NIP57)
class Amount extends TagKind {
  const Amount();
}

/// Custom tag kind
class Custom extends TagKind {
  final String tag;

  const Custom(this.tag);
}

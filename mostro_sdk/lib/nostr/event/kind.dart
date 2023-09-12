/// Event [`Kind`]
sealed class Kind {
  const Kind();

  factory Kind.from(int u) {
    return switch (u) {
      0 => const Metadata(),
      1 => const TextNote(),
      2 => const RecommendRelay(),
      3 => const ContactList(),
      4 => const EncryptedDirectMessage(),
      5 => const EventDeletion(),
      6 => const Repost(),
      7 => const Reaction(),
      40 => const ChannelCreation(),
      41 => const ChannelMetadata(),
      42 => const ChannelMessage(),
      43 => const ChannelHideMessage(),
      44 => const ChannelMuteUser(),
      45 => const PublicChatReserved45(),
      46 => const PublicChatReserved46(),
      47 => const PublicChatReserved47(),
      48 => const PublicChatReserved48(),
      49 => const PublicChatReserved49(),
      1984 => const Reporting(),
      9734 => const ZapRequest(),
      9735 => const Zap(),
      10002 => const RelayList(),
      22242 => const Authentication(),
      24133 => const NostrConnect(),
      30023 => const LongFormTextNote(),
      >= 10000 && < 20000 => Replaceable(u),
      >= 20000 && < 30000 => Ephemeral(u),
      >= 30000 && < 40000 => ParameterizedReplaceable(u),
      _ => Custom(u),
    };
  }

  int to() {
    return switch (this) {
      (Metadata()) => 0,
      (TextNote()) => 1,
      (RecommendRelay()) => 2,
      (ContactList()) => 3,
      (EncryptedDirectMessage()) => 4,
      (EventDeletion()) => 5,
      (Repost()) => 6,
      (Reaction()) => 7,
      (ChannelCreation()) => 40,
      (ChannelMetadata()) => 41,
      (ChannelMessage()) => 42,
      (ChannelHideMessage()) => 43,
      (ChannelMuteUser()) => 44,
      (PublicChatReserved45()) => 45,
      (PublicChatReserved46()) => 46,
      (PublicChatReserved47()) => 47,
      (PublicChatReserved48()) => 48,
      (PublicChatReserved49()) => 49,
      (Reporting()) => 1984,
      (ZapRequest()) => 9734,
      (Zap()) => 9735,
      (RelayList()) => 10002,
      (Authentication()) => 22242,
      (NostrConnect()) => 24133,
      (LongFormTextNote()) => 30023,
      (Replaceable(u: var u)) => u,
      (Ephemeral(u: var u)) => u,
      (ParameterizedReplaceable(u: var u)) => u,
      (Custom(u: var u)) => u,
    };
  }
}

/// Metadata (NIP01 and NIP05)
class Metadata extends Kind {
  const Metadata();
}

/// Short Text Note (NIP01)
class TextNote extends Kind {
  const TextNote();
}

/// Recommend Relay (NIP01)
class RecommendRelay extends Kind {
  const RecommendRelay();
}

/// Contacts (NIP02)
class ContactList extends Kind {
  const ContactList();
}

/// Encrypted Direct Messages (NIP04)
class EncryptedDirectMessage extends Kind {
  const EncryptedDirectMessage();
}

/// Event Deletion (NIP09)
class EventDeletion extends Kind {
  const EventDeletion();
}

/// Repost (NIP18)
class Repost extends Kind {
  const Repost();
}

/// Reaction (NIP25)
class Reaction extends Kind {
  const Reaction();
}

/// Channel Creation (NIP28)
class ChannelCreation extends Kind {
  const ChannelCreation();
}

/// Channel Metadata (NIP28)
class ChannelMetadata extends Kind {
  const ChannelMetadata();
}

/// Channel Message (NIP28)
class ChannelMessage extends Kind {
  const ChannelMessage();
}

/// Channel Hide Message (NIP28)
class ChannelHideMessage extends Kind {
  const ChannelHideMessage();
}

/// Channel Mute User (NIP28)
class ChannelMuteUser extends Kind {
  const ChannelMuteUser();
}

/// Public Chat Reserved (NIP28)
class PublicChatReserved45 extends Kind {
  const PublicChatReserved45();
}

/// Public Chat Reserved (NIP28)
class PublicChatReserved46 extends Kind {
  const PublicChatReserved46();
}

/// Public Chat Reserved (NIP28)
class PublicChatReserved47 extends Kind {
  const PublicChatReserved47();
}

/// Public Chat Reserved (NIP28)
class PublicChatReserved48 extends Kind {
  const PublicChatReserved48();
}

/// Public Chat Reserved (NIP28)
class PublicChatReserved49 extends Kind {
  const PublicChatReserved49();
}

/// Reporting (NIP56)
class Reporting extends Kind {
  const Reporting();
}

/// Zap Request (NIP57)
class ZapRequest extends Kind {
  const ZapRequest();
}

/// Zap (NIP57)
class Zap extends Kind {
  const Zap();
}

/// Client Authentication (NIP42)
class Authentication extends Kind {
  const Authentication();
}

/// Nostr Connect (NIP46)
class NostrConnect extends Kind {
  const NostrConnect();
}

/// Long-form Text Note (NIP23)
class LongFormTextNote extends Kind {
  const LongFormTextNote();
}

/// Relay List Metadata (NIP65)
class RelayList extends Kind {
  const RelayList();
}

/// Replacabe event (must be between 10000 and <20000)
class Replaceable extends Kind {
  final int u;
  const Replaceable(this.u);
}

/// Ephemeral event (must be between 20000 and <30000)
class Ephemeral extends Kind {
  final int u;
  const Ephemeral(this.u);
}

/// Parameterized Replacabe event (must be between 30000 and <40000)
class ParameterizedReplaceable extends Kind {
  final int u;
  const ParameterizedReplaceable(this.u);
}

/// Custom
class Custom extends Kind {
  final int u;
  const Custom(this.u);
}

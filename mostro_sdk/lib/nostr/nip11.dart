/// NIP11
///
/// <https://github.com/nostr-protocol/nips/blob/master/11.md>
import 'dart:convert';

typedef SocketAddr = String;

/// NIP11 error
sealed class Nip11Error implements Exception {
  final String message;

  const Nip11Error(this.message);
}

/// Reqwest error
class ReqwestError extends Nip11Error {
  const ReqwestError(String message) : super(message);
}

/// The relay information document is invalid
class InvalidInformationDocument extends Nip11Error {
  const InvalidInformationDocument()
      : super("The relay information document is invalid");
}

/// The relay information document is not accessible
class InaccessibleInformationDocument extends Nip11Error {
  const InaccessibleInformationDocument()
      : super("The relay information document is not accessible");
}

/// Provided URL scheme is not valid
class InvalidScheme extends Nip11Error {
  const InvalidScheme() : super("Provided URL scheme is not valid");
}

class RelayInformationDocument {
  /// Name
  final String? name;

  /// Description
  final String? description;

  /// Owner public key
  final String? pubkey;

  /// Owner contact
  final String? contact;

  /// Supported NIPs
  final List<int>? supportedNips;

  /// Software
  final String? software;

  /// Software version
  final String? version;

  const RelayInformationDocument({
    this.name,
    this.description,
    this.pubkey,
    this.contact,
    this.supportedNips,
    this.software,
    this.version,
  });

  /// Get Relay Information Document
  Future<RelayInformationDocument> get(
    Uri url, [
    SocketAddr? proxy,
  ]) async {
    throw UnimplementedError();
  }

  Future<RelayInformationDocument> getBlocking(
    Uri url, [
    SocketAddr? proxy,
  ]) async {
    throw UnimplementedError();
  }

  /// Returns new URL with scheme substituted to HTTP(S) if WS(S) was provided,
  /// other schemes leaves untouched.
  Future<Uri> withHttpScheme(Uri url) async {
    throw UnimplementedError();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'pubkey': pubkey,
      'contact': contact,
      'supported_nips': supportedNips,
      'software': software,
      'version': version,
    };
  }

  factory RelayInformationDocument.fromMap(Map<String, dynamic> map) {
    return RelayInformationDocument(
      name: map['name'] as String?,
      description: map['description'] as String?,
      pubkey: map['pubkey'] as String?,
      contact: map['contact'] as String?,
      supportedNips: map['supported_nips'] as List<int>?,
      software: map['software'] as String?,
      version: map['version'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory RelayInformationDocument.fromJson(String source) =>
      RelayInformationDocument.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

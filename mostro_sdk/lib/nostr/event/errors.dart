/// [`Event`] error
sealed class EventError implements Exception {
  final String message;

  const EventError(this.message);
}

class InvalidSignature extends EventError {
  const InvalidSignature() : super('invalid signature');
}

class Json extends EventError {
  const Json() : super('error serializing or deserializing JSON data');
}

class Secp256k1 extends EventError {
  const Secp256k1() : super('secp256k1 error');
}

class Hex extends EventError {
  const Hex() : super('hex decoding error');
}

class OpenTimestamps extends EventError {
  const OpenTimestamps() : super('OpenTimestamps error');
}

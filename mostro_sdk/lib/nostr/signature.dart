import 'package:flutter/foundation.dart';

/// The size of a schnorr signature.
const schnorrSignatureSize = 64;

/// Represents a schnorr signature.
class Signature {
  final List<int> values;
  Signature(this.values) {
    if (values.length != schnorrSignatureSize) {
      throw ArgumentError('Signature size must be $schnorrSignatureSize');
    }
  }

  @override
  bool operator ==(covariant Signature other) {
    if (identical(this, other)) return true;

    return listEquals(other.values, values);
  }

  @override
  int get hashCode => values.hashCode;
}

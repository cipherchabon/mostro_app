/// An x-only public key, used for verification of schnorr signatures and
/// serialized according to BIP-340.
class XOnlyPublicKey {
  final List<int> bytes;

  XOnlyPublicKey(this.bytes) {
    if (bytes.length != 64) {
      throw Exception('XOnlyPublicKey must be 64 bytes');
    }
  }
}

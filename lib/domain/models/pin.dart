class Pin {
  final String hash;
  final String salt;
  final DateTime createdAt;

  const Pin({
    required this.hash,
    required this.salt,
    required this.createdAt,
  });

  factory Pin.fromJson(Map<String, dynamic> json) {
    return Pin(
      hash: json['hash'],
      salt: json['salt'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'salt': salt,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

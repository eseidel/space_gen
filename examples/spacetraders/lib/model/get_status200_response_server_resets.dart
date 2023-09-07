class GetStatus200ResponseServerResets {
  GetStatus200ResponseServerResets({
    required this.next,
    required this.frequency,
  });

  factory GetStatus200ResponseServerResets.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseServerResets(
      next: json['next'] as String,
      frequency: json['frequency'] as String,
    );
  }

  final String next;
  final String frequency;

  Map<String, dynamic> toJson() {
    return {
      'next': next,
      'frequency': frequency,
    };
  }
}

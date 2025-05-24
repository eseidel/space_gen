class Chart {
  Chart({
    required this.waypointSymbol,
    required this.submittedBy,
    required this.submittedOn,
  });

  factory Chart.fromJson(Map<String, dynamic> json) {
    return Chart(
      waypointSymbol: json['waypointSymbol'] as String,
      submittedBy: json['submittedBy'] as String,
      submittedOn: DateTime.parse(json['submittedOn'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Chart? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Chart.fromJson(json);
  }

  final String waypointSymbol;
  final String submittedBy;
  final DateTime submittedOn;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
      'submittedBy': submittedBy,
      'submittedOn': submittedOn.toIso8601String(),
    };
  }
}

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

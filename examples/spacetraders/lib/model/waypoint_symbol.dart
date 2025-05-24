extension type WaypointSymbol(String value) {
  factory WaypointSymbol.fromJson(String json) => WaypointSymbol(json);

  String toJson() => value;
}

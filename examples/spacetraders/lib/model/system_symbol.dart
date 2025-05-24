extension type SystemSymbol(String value) {
  factory SystemSymbol.fromJson(String json) => SystemSymbol(json);

  String toJson() => value;
}

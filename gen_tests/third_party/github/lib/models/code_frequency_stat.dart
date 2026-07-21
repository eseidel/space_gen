/// Code Frequency Stat
/// Code Frequency Stat
extension type const CodeFrequencyStat._(List<int> value) implements List<int> {
  const CodeFrequencyStat(this.value);

  factory CodeFrequencyStat.fromJson(List<dynamic> json) =>
      CodeFrequencyStat(json.cast<int>());

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeFrequencyStat? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeFrequencyStat.fromJson(json);
  }

  List<dynamic> toJson() => value;
}

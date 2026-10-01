// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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

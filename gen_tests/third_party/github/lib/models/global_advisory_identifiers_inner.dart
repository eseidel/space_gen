import 'package:github/model_helpers.dart';
import 'package:github/models/global_advisory_identifiers_inner_type.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalAdvisoryIdentifiersInner {
  const GlobalAdvisoryIdentifiersInner({
    required this.type,
    required this.value,
  });

  /// Converts a `Map<String, dynamic>` to a [GlobalAdvisoryIdentifiersInner].
  factory GlobalAdvisoryIdentifiersInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GlobalAdvisoryIdentifiersInner',
      json,
      () => GlobalAdvisoryIdentifiersInner(
        type: GlobalAdvisoryIdentifiersInnerType.fromJson(
          json['type'] as String,
        ),
        value: json['value'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GlobalAdvisoryIdentifiersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GlobalAdvisoryIdentifiersInner.fromJson(json);
  }

  /// The type of identifier.
  final GlobalAdvisoryIdentifiersInnerType type;

  /// The identifier value.
  final String value;

  /// Converts a [GlobalAdvisoryIdentifiersInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'value': value};
  }

  @override
  int get hashCode => Object.hashAll([type, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlobalAdvisoryIdentifiersInner &&
        type == other.type &&
        value == other.value;
  }
}

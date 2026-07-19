import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AuditLogObjectChangeResponse {
  const AuditLogObjectChangeResponse({
    required this.key,
    this.newValue,
    this.oldValue,
  });

  /// Converts a `Map<String, dynamic>` to an [AuditLogObjectChangeResponse].
  factory AuditLogObjectChangeResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AuditLogObjectChangeResponse',
      json,
      () => AuditLogObjectChangeResponse(
        key: checkedKey(json, 'key') as String?,
        newValue: json['new_value'],
        oldValue: json['old_value'],
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AuditLogObjectChangeResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AuditLogObjectChangeResponse.fromJson(json);
  }

  final String? key;
  final dynamic newValue;
  final dynamic oldValue;

  /// Converts an [AuditLogObjectChangeResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      if (newValue != null) 'new_value': newValue,
      if (oldValue != null) 'old_value': oldValue,
    };
  }

  @override
  int get hashCode => Object.hashAll([key, newValue, oldValue]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuditLogObjectChangeResponse &&
        key == other.key &&
        newValue == other.newValue &&
        oldValue == other.oldValue;
  }
}

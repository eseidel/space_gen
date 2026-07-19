import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AccountResponse {
  const AccountResponse({required this.id, required this.name});

  /// Converts a `Map<String, dynamic>` to an [AccountResponse].
  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AccountResponse',
      json,
      () => AccountResponse(
        id: json['id'] as String,
        name: checkedKey(json, 'name') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AccountResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AccountResponse.fromJson(json);
  }

  final String id;
  final String? name;

  /// Converts an [AccountResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccountResponse && id == other.id && name == other.name;
  }
}

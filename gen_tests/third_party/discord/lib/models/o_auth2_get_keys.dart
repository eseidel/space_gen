import 'package:discord/model_helpers.dart';
import 'package:discord/models/o_auth2_key.dart';
import 'package:meta/meta.dart';

@immutable
class OAuth2GetKeys {
  const OAuth2GetKeys({required this.keys});

  /// Converts a `Map<String, dynamic>` to an [OAuth2GetKeys].
  factory OAuth2GetKeys.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OAuth2GetKeys',
      json,
      () => OAuth2GetKeys(
        keys: (json['keys'] as List)
            .map<OAuth2Key>(
              (e) => OAuth2Key.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OAuth2GetKeys? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OAuth2GetKeys.fromJson(json);
  }

  final List<OAuth2Key> keys;

  /// Converts an [OAuth2GetKeys] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'keys': keys.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(keys).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OAuth2GetKeys && listsEqual(keys, other.keys);
  }
}

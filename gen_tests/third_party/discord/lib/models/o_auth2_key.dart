import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OAuth2Key {
  const OAuth2Key({
    required this.kty,
    required this.use,
    required this.kid,
    required this.n,
    required this.e,
    required this.alg,
  });

  /// Converts a `Map<String, dynamic>` to an [OAuth2Key].
  factory OAuth2Key.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OAuth2Key',
      json,
      () => OAuth2Key(
        kty: json['kty'] as String,
        use: json['use'] as String,
        kid: json['kid'] as String,
        n: json['n'] as String,
        e: json['e'] as String,
        alg: json['alg'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OAuth2Key? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OAuth2Key.fromJson(json);
  }

  final String kty;
  final String use;
  final String kid;
  final String n;
  final String e;
  final String alg;

  /// Converts an [OAuth2Key] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'kty': kty, 'use': use, 'kid': kid, 'n': n, 'e': e, 'alg': alg};
  }

  @override
  int get hashCode => Object.hashAll([kty, use, kid, n, e, alg]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OAuth2Key &&
        kty == other.kty &&
        use == other.use &&
        kid == other.kid &&
        n == other.n &&
        e == other.e &&
        alg == other.alg;
  }
}

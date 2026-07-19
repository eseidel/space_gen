import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template social_account}
/// Social account
/// Social media account
/// {@endtemplate}
@immutable
class SocialAccount {
  /// {@macro social_account}
  const SocialAccount({required this.provider, required this.url});

  /// Converts a `Map<String, dynamic>` to a [SocialAccount].
  factory SocialAccount.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SocialAccount',
      json,
      () => SocialAccount(
        provider: json['provider'] as String,
        url: json['url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SocialAccount? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SocialAccount.fromJson(json);
  }

  /// Example: `'linkedin'`
  final String provider;

  /// Example: `'https://www.linkedin.com/company/github/'`
  final String url;

  /// Converts a [SocialAccount] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'provider': provider, 'url': url};
  }

  @override
  int get hashCode => Object.hashAll([provider, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SocialAccount &&
        provider == other.provider &&
        url == other.url;
  }
}

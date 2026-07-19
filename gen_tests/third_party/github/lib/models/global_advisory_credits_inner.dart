import 'package:github/model_helpers.dart';
import 'package:github/models/security_advisory_credit_types.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalAdvisoryCreditsInner {
  const GlobalAdvisoryCreditsInner({required this.user, required this.type});

  /// Converts a `Map<String, dynamic>` to a [GlobalAdvisoryCreditsInner].
  factory GlobalAdvisoryCreditsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GlobalAdvisoryCreditsInner',
      json,
      () => GlobalAdvisoryCreditsInner(
        user: SimpleUser.fromJson(json['user'] as Map<String, dynamic>),
        type: SecurityAdvisoryCreditTypes.fromJson(json['type'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GlobalAdvisoryCreditsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GlobalAdvisoryCreditsInner.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser user;

  /// The type of credit the user is receiving.
  final SecurityAdvisoryCreditTypes type;

  /// Converts a [GlobalAdvisoryCreditsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'user': user.toJson(), 'type': type.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([user, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlobalAdvisoryCreditsInner &&
        user == other.user &&
        type == other.type;
  }
}

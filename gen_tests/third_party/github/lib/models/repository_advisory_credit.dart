import 'package:github/model_helpers.dart';
import 'package:github/models/repository_advisory_credit_state.dart';
import 'package:github/models/security_advisory_credit_types.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template repository_advisory_credit}
/// A credit given to a user for a repository security advisory.
/// {@endtemplate}
@immutable
class RepositoryAdvisoryCredit {
  /// {@macro repository_advisory_credit}
  const RepositoryAdvisoryCredit({
    required this.user,
    required this.type,
    required this.state,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisoryCredit].
  factory RepositoryAdvisoryCredit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisoryCredit',
      json,
      () => RepositoryAdvisoryCredit(
        user: SimpleUser.fromJson(json['user'] as Map<String, dynamic>),
        type: SecurityAdvisoryCreditTypes.fromJson(json['type'] as String),
        state: RepositoryAdvisoryCreditState.fromJson(json['state'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCredit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCredit.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser user;

  /// The type of credit the user is receiving.
  final SecurityAdvisoryCreditTypes type;

  /// The state of the user's acceptance of the credit.
  final RepositoryAdvisoryCreditState state;

  /// Converts a [RepositoryAdvisoryCredit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'type': type.toJson(),
      'state': state.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([user, type, state]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryCredit &&
        user == other.user &&
        type == other.type &&
        state == other.state;
  }
}

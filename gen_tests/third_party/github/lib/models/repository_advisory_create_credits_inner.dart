import 'package:github/model_helpers.dart';
import 'package:github/models/security_advisory_credit_types.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisoryCreateCreditsInner {
  const RepositoryAdvisoryCreateCreditsInner({
    required this.login,
    required this.type,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryAdvisoryCreateCreditsInner].
  factory RepositoryAdvisoryCreateCreditsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryAdvisoryCreateCreditsInner',
      json,
      () => RepositoryAdvisoryCreateCreditsInner(
        login: json['login'] as String,
        type: SecurityAdvisoryCreditTypes.fromJson(json['type'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCreateCreditsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCreateCreditsInner.fromJson(json);
  }

  /// The username of the user credited.
  final String login;

  /// The type of credit the user is receiving.
  final SecurityAdvisoryCreditTypes type;

  /// Converts a [RepositoryAdvisoryCreateCreditsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'login': login, 'type': type.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([login, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryCreateCreditsInner &&
        login == other.login &&
        type == other.type;
  }
}

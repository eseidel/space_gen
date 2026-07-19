import 'package:github/model_helpers.dart';
import 'package:github/models/security_advisory_credit_types.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisoryCreditsInner {
  const RepositoryAdvisoryCreditsInner({this.login, this.type});

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisoryCreditsInner].
  factory RepositoryAdvisoryCreditsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisoryCreditsInner',
      json,
      () => RepositoryAdvisoryCreditsInner(
        login: json['login'] as String?,
        type: SecurityAdvisoryCreditTypes.maybeFromJson(
          json['type'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCreditsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCreditsInner.fromJson(json);
  }

  /// The username of the user credited.
  final String? login;

  /// The type of credit the user is receiving.
  final SecurityAdvisoryCreditTypes? type;

  /// Converts a [RepositoryAdvisoryCreditsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'login': ?login, 'type': ?type?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([login, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryCreditsInner &&
        login == other.login &&
        type == other.type;
  }
}

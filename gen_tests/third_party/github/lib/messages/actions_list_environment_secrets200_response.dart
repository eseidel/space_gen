import 'package:github/model_helpers.dart';
import 'package:github/models/actions_secret.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListEnvironmentSecrets200Response {
  const ActionsListEnvironmentSecrets200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListEnvironmentSecrets200Response].
  factory ActionsListEnvironmentSecrets200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListEnvironmentSecrets200Response',
      json,
      () => ActionsListEnvironmentSecrets200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<ActionsSecret>(
              (e) => ActionsSecret.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListEnvironmentSecrets200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListEnvironmentSecrets200Response.fromJson(json);
  }

  final int totalCount;
  final List<ActionsSecret> secrets;

  /// Converts an [ActionsListEnvironmentSecrets200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'secrets': secrets.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(secrets)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListEnvironmentSecrets200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}

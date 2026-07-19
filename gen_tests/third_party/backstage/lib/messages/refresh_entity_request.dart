import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template refresh_entity_request}
/// Options for requesting a refresh of entities in the catalog.
/// {@endtemplate}
@immutable
class RefreshEntityRequest {
  /// {@macro refresh_entity_request}
  const RefreshEntityRequest({
    required this.entityRef,
    this.authorizationToken,
  });

  /// Converts a `Map<String, dynamic>` to a [RefreshEntityRequest].
  factory RefreshEntityRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RefreshEntityRequest',
      json,
      () => RefreshEntityRequest(
        authorizationToken: json['authorizationToken'] as String?,
        entityRef: json['entityRef'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RefreshEntityRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RefreshEntityRequest.fromJson(json);
  }

  final String? authorizationToken;

  /// The reference to a single entity that should be refreshed
  final String entityRef;

  /// Converts a [RefreshEntityRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (authorizationToken != null) 'authorizationToken': authorizationToken,
      'entityRef': entityRef,
    };
  }

  @override
  int get hashCode => Object.hashAll([authorizationToken, entityRef]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RefreshEntityRequest &&
        authorizationToken == other.authorizationToken &&
        entityRef == other.entityRef;
  }
}

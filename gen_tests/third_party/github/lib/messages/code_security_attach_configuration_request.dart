import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_attach_configuration_request_scope.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityAttachConfigurationRequest {
  const CodeSecurityAttachConfigurationRequest({
    required this.scope,
    this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityAttachConfigurationRequest].
  factory CodeSecurityAttachConfigurationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityAttachConfigurationRequest',
      json,
      () => CodeSecurityAttachConfigurationRequest(
        scope: CodeSecurityAttachConfigurationRequestScope.fromJson(
          json['scope'] as String,
        ),
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityAttachConfigurationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityAttachConfigurationRequest.fromJson(json);
  }

  /// The type of repositories to attach the configuration to. `selected`
  /// means the configuration will be attached to only the repositories
  /// specified by `selected_repository_ids`
  final CodeSecurityAttachConfigurationRequestScope scope;

  /// An array of repository IDs to attach the configuration to. You can only
  /// provide a list of repository ids when the `scope` is set to `selected`.
  final List<int>? selectedRepositoryIds;

  /// Converts a [CodeSecurityAttachConfigurationRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'scope': scope.toJson(),
      if (selectedRepositoryIds != null)
        'selected_repository_ids': selectedRepositoryIds,
    };
  }

  @override
  int get hashCode => Object.hashAll([scope, listHash(selectedRepositoryIds)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityAttachConfigurationRequest &&
        scope == other.scope &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}

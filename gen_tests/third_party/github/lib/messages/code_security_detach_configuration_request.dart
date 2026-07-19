import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityDetachConfigurationRequest {
  const CodeSecurityDetachConfigurationRequest({this.selectedRepositoryIds});

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityDetachConfigurationRequest].
  factory CodeSecurityDetachConfigurationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityDetachConfigurationRequest',
      json,
      () => CodeSecurityDetachConfigurationRequest(
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityDetachConfigurationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityDetachConfigurationRequest.fromJson(json);
  }

  /// An array of repository IDs to detach from configurations.
  final List<int>? selectedRepositoryIds;

  /// Converts a [CodeSecurityDetachConfigurationRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (selectedRepositoryIds != null)
        'selected_repository_ids': selectedRepositoryIds,
    };
  }

  @override
  int get hashCode => listHash(selectedRepositoryIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityDetachConfigurationRequest &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}

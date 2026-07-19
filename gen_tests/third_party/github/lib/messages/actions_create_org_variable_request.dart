import 'package:github/model_helpers.dart';
import 'package:github/models/actions_create_org_variable_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateOrgVariableRequest {
  const ActionsCreateOrgVariableRequest({
    required this.name,
    required this.value,
    required this.visibility,
    this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsCreateOrgVariableRequest].
  factory ActionsCreateOrgVariableRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsCreateOrgVariableRequest',
      json,
      () => ActionsCreateOrgVariableRequest(
        name: json['name'] as String,
        value: json['value'] as String,
        visibility: ActionsCreateOrgVariableRequestVisibility.fromJson(
          json['visibility'] as String,
        ),
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateOrgVariableRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateOrgVariableRequest.fromJson(json);
  }

  /// The name of the variable.
  final String name;

  /// The value of the variable.
  final String value;

  /// The type of repositories in the organization that can access the
  /// variable. `selected` means only the repositories specified by
  /// `selected_repository_ids` can access the variable.
  final ActionsCreateOrgVariableRequestVisibility visibility;

  /// An array of repository ids that can access the organization variable.
  /// You can only provide a list of repository ids when the `visibility` is
  /// set to `selected`.
  final List<int>? selectedRepositoryIds;

  /// Converts an [ActionsCreateOrgVariableRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'visibility': visibility.toJson(),
      'selected_repository_ids': ?selectedRepositoryIds,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    value,
    visibility,
    listHash(selectedRepositoryIds),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateOrgVariableRequest &&
        name == other.name &&
        value == other.value &&
        visibility == other.visibility &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}

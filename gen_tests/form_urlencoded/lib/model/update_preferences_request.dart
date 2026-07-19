import 'package:form_urlencoded/date.dart';
import 'package:form_urlencoded/model/update_preferences_request_visibility.dart';
import 'package:form_urlencoded/model_helpers.dart';

class UpdatePreferencesRequest {
  UpdatePreferencesRequest({required this.visibility, this.since});

  /// Converts a `Map<String, dynamic>` to a [UpdatePreferencesRequest].
  factory UpdatePreferencesRequest.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'UpdatePreferencesRequest',
      json,
      () => UpdatePreferencesRequest(
        visibility: UpdatePreferencesRequestVisibility.fromJson(
          json['visibility'] as String,
        ),
        since: Date.maybeFromJson(json['since'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdatePreferencesRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdatePreferencesRequest.fromJson(json);
  }

  UpdatePreferencesRequestVisibility visibility;
  Date? since;

  /// Converts a [UpdatePreferencesRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'visibility': visibility.toJson(), 'since': ?since?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([visibility, since]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdatePreferencesRequest &&
        visibility == other.visibility &&
        since == other.since;
  }
}

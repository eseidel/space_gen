import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdatePatAccessesRequest {
  OrgsUpdatePatAccessesRequest({required this.patIds}) {
    patIds.validate(minItems: 1, maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to an [OrgsUpdatePatAccessesRequest].
  factory OrgsUpdatePatAccessesRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsUpdatePatAccessesRequest',
      json,
      () => OrgsUpdatePatAccessesRequest(
        patIds: (json['pat_ids'] as List).cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdatePatAccessesRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsUpdatePatAccessesRequest.fromJson(json);
  }

  /// Action to apply to the fine-grained personal access token.
  String get action => 'revoke';

  /// The IDs of the fine-grained personal access tokens.
  final List<int> patIds;

  /// Converts an [OrgsUpdatePatAccessesRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'action': action, 'pat_ids': patIds};
  }

  @override
  int get hashCode => listHash(patIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdatePatAccessesRequest &&
        listsEqual(patIds, other.patIds);
  }
}

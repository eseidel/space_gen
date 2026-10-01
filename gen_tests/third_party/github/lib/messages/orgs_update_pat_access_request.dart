// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdatePatAccessRequest {
  const OrgsUpdatePatAccessRequest();

  /// Converts a `Map<String, dynamic>` to an [OrgsUpdatePatAccessRequest].
  factory OrgsUpdatePatAccessRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsUpdatePatAccessRequest',
      json,
      OrgsUpdatePatAccessRequest.new,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdatePatAccessRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgsUpdatePatAccessRequest.fromJson(json);
  }

  /// Action to apply to the fine-grained personal access token.
  String get action => 'revoke';

  /// Converts an [OrgsUpdatePatAccessRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'action': action};
  }

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdatePatAccessRequest;
  }
}

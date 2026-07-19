// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/messages/interaction_limit_response.dart';
import 'package:github/models/interactions_get_restrictions_for_org200_response_any_of_1.dart';
import 'package:meta/meta.dart';

sealed class InteractionsGetRestrictionsForOrg200Response {
  const InteractionsGetRestrictionsForOrg200Response();

  factory InteractionsGetRestrictionsForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('expires_at')) {
      return InteractionsGetRestrictionsForOrg200ResponseInteractionLimitResponse(
        InteractionLimitResponse.fromJson(json),
      );
    }
    return InteractionsGetRestrictionsForOrg200ResponseVariant1(
      InteractionsGetRestrictionsForOrg200ResponseAnyOf1.fromJson(json),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionsGetRestrictionsForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InteractionsGetRestrictionsForOrg200Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class InteractionsGetRestrictionsForOrg200ResponseInteractionLimitResponse
    extends InteractionsGetRestrictionsForOrg200Response {
  const InteractionsGetRestrictionsForOrg200ResponseInteractionLimitResponse(
    this.value,
  );

  final InteractionLimitResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is InteractionsGetRestrictionsForOrg200ResponseInteractionLimitResponse &&
        value == other.value;
  }
}

@immutable
final class InteractionsGetRestrictionsForOrg200ResponseVariant1
    extends InteractionsGetRestrictionsForOrg200Response {
  const InteractionsGetRestrictionsForOrg200ResponseVariant1(this.value);

  final InteractionsGetRestrictionsForOrg200ResponseAnyOf1 value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InteractionsGetRestrictionsForOrg200ResponseVariant1 &&
        value == other.value;
  }
}

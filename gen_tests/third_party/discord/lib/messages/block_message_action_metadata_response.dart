import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BlockMessageActionMetadataResponse {
  const BlockMessageActionMetadataResponse({this.customMessage});

  /// Converts a `Map<String, dynamic>` to a
  /// [BlockMessageActionMetadataResponse].
  factory BlockMessageActionMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BlockMessageActionMetadataResponse',
      json,
      () => BlockMessageActionMetadataResponse(
        customMessage: json['custom_message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BlockMessageActionMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BlockMessageActionMetadataResponse.fromJson(json);
  }

  final String? customMessage;

  /// Converts a [BlockMessageActionMetadataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'custom_message': ?customMessage};
  }

  @override
  int get hashCode => customMessage.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BlockMessageActionMetadataResponse &&
        customMessage == other.customMessage;
  }
}

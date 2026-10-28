import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BlockMessageActionMetadata {
  BlockMessageActionMetadata({this.customMessage}) {
    customMessage?.validate(maxLength: 300);
  }

  /// Converts a `Map<String, dynamic>` to a [BlockMessageActionMetadata].
  factory BlockMessageActionMetadata.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BlockMessageActionMetadata',
      json,
      () => BlockMessageActionMetadata(
        customMessage: json['custom_message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BlockMessageActionMetadata? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BlockMessageActionMetadata.fromJson(json);
  }

  final String? customMessage;

  /// Converts a [BlockMessageActionMetadata] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'custom_message': customMessage};
  }

  @override
  int get hashCode => customMessage.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BlockMessageActionMetadata &&
        customMessage == other.customMessage;
  }
}

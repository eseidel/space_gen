import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BlockMessageActionMetadata1 {
  BlockMessageActionMetadata1({this.customMessage}) {
    customMessage?.validate(maxLength: 300);
  }

  /// Converts a `Map<String, dynamic>` to a [BlockMessageActionMetadata1].
  factory BlockMessageActionMetadata1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BlockMessageActionMetadata1',
      json,
      () => BlockMessageActionMetadata1(
        customMessage: json['custom_message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BlockMessageActionMetadata1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BlockMessageActionMetadata1.fromJson(json);
  }

  final String? customMessage;

  /// Converts a [BlockMessageActionMetadata1] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'custom_message': customMessage};
  }

  @override
  int get hashCode => customMessage.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BlockMessageActionMetadata1 &&
        customMessage == other.customMessage;
  }
}

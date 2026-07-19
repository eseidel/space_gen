import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_separator_spacing_size.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class SeparatorComponentForMessageRequest {
  const SeparatorComponentForMessageRequest({
    this.id,
    this.spacing,
    this.divider,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SeparatorComponentForMessageRequest].
  factory SeparatorComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SeparatorComponentForMessageRequest',
      json,
      () => SeparatorComponentForMessageRequest(
        id: json['id'] as int?,
        spacing: MessageComponentSeparatorSpacingSize.maybeFromJson(
          json['spacing'] as int?,
        ),
        divider: json['divider'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SeparatorComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SeparatorComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.separator;
  final int? id;
  final MessageComponentSeparatorSpacingSize? spacing;
  final bool? divider;

  /// Converts a [SeparatorComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'spacing': spacing?.toJson(),
      'divider': divider,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, spacing, divider]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SeparatorComponentForMessageRequest &&
        id == other.id &&
        spacing == other.spacing &&
        divider == other.divider;
  }
}

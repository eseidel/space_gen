import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_separator_spacing_size.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class SeparatorComponentResponse {
  const SeparatorComponentResponse({
    required this.id,
    required this.spacing,
    required this.divider,
  });

  /// Converts a `Map<String, dynamic>` to a [SeparatorComponentResponse].
  factory SeparatorComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SeparatorComponentResponse',
      json,
      () => SeparatorComponentResponse(
        id: json['id'] as int,
        spacing: MessageComponentSeparatorSpacingSize.fromJson(
          json['spacing'] as int,
        ),
        divider: json['divider'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SeparatorComponentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SeparatorComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.separator;
  final int id;
  final MessageComponentSeparatorSpacingSize spacing;
  final bool divider;

  /// Converts a [SeparatorComponentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'spacing': spacing.toJson(),
      'divider': divider,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, spacing, divider]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SeparatorComponentResponse &&
        id == other.id &&
        spacing == other.spacing &&
        divider == other.divider;
  }
}

import 'package:discord/messages/text_display_component_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/section_component_response_accessory.dart';
import 'package:meta/meta.dart';

@immutable
class SectionComponentResponse {
  const SectionComponentResponse({
    required this.id,
    required this.components,
    required this.accessory,
  });

  /// Converts a `Map<String, dynamic>` to a [SectionComponentResponse].
  factory SectionComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SectionComponentResponse',
      json,
      () => SectionComponentResponse(
        id: json['id'] as int,
        components: (json['components'] as List)
            .map<TextDisplayComponentResponse>(
              (e) => TextDisplayComponentResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        accessory: SectionComponentResponseAccessory.fromJson(
          json['accessory'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SectionComponentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SectionComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.section;
  final int id;
  final List<TextDisplayComponentResponse> components;
  final SectionComponentResponseAccessory accessory;

  /// Converts a [SectionComponentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'components': components.map((e) => e.toJson()).toList(),
      'accessory': accessory.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, listHash(components), accessory]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SectionComponentResponse &&
        id == other.id &&
        listsEqual(components, other.components) &&
        accessory == other.accessory;
  }
}

import 'package:discord/api_exception.dart';
import 'package:discord/messages/text_display_component_for_message_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/section_component_for_message_request_accessory.dart';
import 'package:meta/meta.dart';

@immutable
class SectionComponentForMessageRequest {
  SectionComponentForMessageRequest({
    required this.components,
    required this.accessory,
    this.id,
  }) {
    id?.validate(min: 0);
    components.validate(minItems: 1, maxItems: 3);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [SectionComponentForMessageRequest].
  factory SectionComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SectionComponentForMessageRequest',
      json,
      () => SectionComponentForMessageRequest(
        id: json['id'] as int?,
        components: (json['components'] as List)
            .map<TextDisplayComponentForMessageRequest>(
              (e) => TextDisplayComponentForMessageRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        accessory: SectionComponentForMessageRequestAccessory.fromJson(
          json['accessory'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SectionComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SectionComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.section;
  final int? id;
  final List<TextDisplayComponentForMessageRequest> components;
  final SectionComponentForMessageRequestAccessory accessory;

  /// Converts a [SectionComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
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
    return other is SectionComponentForMessageRequest &&
        id == other.id &&
        listsEqual(components, other.components) &&
        accessory == other.accessory;
  }
}

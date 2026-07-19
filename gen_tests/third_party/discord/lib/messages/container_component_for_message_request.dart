import 'package:discord/model_helpers.dart';
import 'package:discord/models/container_component_for_message_request_components_inner.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class ContainerComponentForMessageRequest {
  const ContainerComponentForMessageRequest({
    required this.components,
    this.id,
    this.accentColor,
    this.spoiler,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ContainerComponentForMessageRequest].
  factory ContainerComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ContainerComponentForMessageRequest',
      json,
      () => ContainerComponentForMessageRequest(
        id: json['id'] as int?,
        accentColor: json['accent_color'] as int?,
        components: (json['components'] as List)
            .map<ContainerComponentForMessageRequestComponentsInner>(
              (e) =>
                  ContainerComponentForMessageRequestComponentsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
        spoiler: json['spoiler'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContainerComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ContainerComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.container;
  final int? id;
  final int? accentColor;
  final List<ContainerComponentForMessageRequestComponentsInner> components;
  final bool? spoiler;

  /// Converts a [ContainerComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'accent_color': accentColor,
      'components': components.map((e) => e.toJson()).toList(),
      'spoiler': spoiler,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, accentColor, listHash(components), spoiler]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContainerComponentForMessageRequest &&
        id == other.id &&
        accentColor == other.accentColor &&
        listsEqual(components, other.components) &&
        spoiler == other.spoiler;
  }
}

// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/button_component_for_message_request.dart';
import 'package:discord/messages/string_select_option_for_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_select_default_value.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/mentionable_select_component_for_message_request_default_values_inner.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/role_select_default_value.dart';
import 'package:discord/models/user_select_default_value.dart';
import 'package:meta/meta.dart';

sealed class ActionRowComponentForMessageRequestComponentsInner {
  const ActionRowComponentForMessageRequestComponentsInner();

  factory ActionRowComponentForMessageRequestComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 =>
        ActionRowComponentForMessageRequestComponentsInnerButtonComponentForMessageRequest(
          ButtonComponentForMessageRequest.fromJson(json),
        ),
      8 => ChannelSelectComponentForMessageRequest.fromJson(json),
      7 => MentionableSelectComponentForMessageRequest.fromJson(json),
      6 => RoleSelectComponentForMessageRequest.fromJson(json),
      3 => StringSelectComponentForMessageRequest.fromJson(json),
      5 => UserSelectComponentForMessageRequest.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ActionRowComponentForMessageRequestComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionRowComponentForMessageRequestComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionRowComponentForMessageRequestComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ActionRowComponentForMessageRequestComponentsInnerButtonComponentForMessageRequest
    extends ActionRowComponentForMessageRequestComponentsInner {
  const ActionRowComponentForMessageRequestComponentsInnerButtonComponentForMessageRequest(
    this.value,
  );

  final ButtonComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ActionRowComponentForMessageRequestComponentsInnerButtonComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class ChannelSelectComponentForMessageRequest
    extends ActionRowComponentForMessageRequestComponentsInner {
  const ChannelSelectComponentForMessageRequest({
    required this.customId,
    this.id,
    this.placeholder,
    this.minValues,
    this.maxValues,
    this.disabled,
    this.required_,
    this.defaultValues,
    this.channelTypes,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChannelSelectComponentForMessageRequest].
  factory ChannelSelectComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChannelSelectComponentForMessageRequest',
      json,
      () => ChannelSelectComponentForMessageRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        disabled: json['disabled'] as bool?,
        required_: json['required'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<ChannelSelectDefaultValue>(
              (e) =>
                  ChannelSelectDefaultValue.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        channelTypes: (json['channel_types'] as List?)
            ?.map<ChannelTypes>((e) => ChannelTypes.fromJson(e as int))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChannelSelectComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChannelSelectComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.channelSelect;
  final int? id;
  final String customId;
  final String? placeholder;
  final int? minValues;
  final int? maxValues;
  final bool? disabled;
  final bool? required_;
  final List<ChannelSelectDefaultValue>? defaultValues;
  final List<ChannelTypes>? channelTypes;

  /// Converts a [ChannelSelectComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'required': required_,
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
      'channel_types': channelTypes?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    required_,
    listHash(defaultValues),
    listHash(channelTypes),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelSelectComponentForMessageRequest &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        required_ == other.required_ &&
        listsEqual(defaultValues, other.defaultValues) &&
        listsEqual(channelTypes, other.channelTypes);
  }
}

@immutable
final class MentionableSelectComponentForMessageRequest
    extends ActionRowComponentForMessageRequestComponentsInner {
  const MentionableSelectComponentForMessageRequest({
    required this.customId,
    this.id,
    this.placeholder,
    this.minValues,
    this.maxValues,
    this.disabled,
    this.required_,
    this.defaultValues,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MentionableSelectComponentForMessageRequest].
  factory MentionableSelectComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MentionableSelectComponentForMessageRequest',
      json,
      () => MentionableSelectComponentForMessageRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        disabled: json['disabled'] as bool?,
        required_: json['required'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<
              MentionableSelectComponentForMessageRequestDefaultValuesInner
            >(
              (e) =>
                  MentionableSelectComponentForMessageRequestDefaultValuesInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionableSelectComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MentionableSelectComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.mentionableSelect;
  final int? id;
  final String customId;
  final String? placeholder;
  final int? minValues;
  final int? maxValues;
  final bool? disabled;
  final bool? required_;
  final List<MentionableSelectComponentForMessageRequestDefaultValuesInner>?
  defaultValues;

  /// Converts a [MentionableSelectComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'required': required_,
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    required_,
    listHash(defaultValues),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MentionableSelectComponentForMessageRequest &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        required_ == other.required_ &&
        listsEqual(defaultValues, other.defaultValues);
  }
}

@immutable
final class RoleSelectComponentForMessageRequest
    extends ActionRowComponentForMessageRequestComponentsInner {
  const RoleSelectComponentForMessageRequest({
    required this.customId,
    this.id,
    this.placeholder,
    this.minValues,
    this.maxValues,
    this.disabled,
    this.required_,
    this.defaultValues,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RoleSelectComponentForMessageRequest].
  factory RoleSelectComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RoleSelectComponentForMessageRequest',
      json,
      () => RoleSelectComponentForMessageRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        disabled: json['disabled'] as bool?,
        required_: json['required'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<RoleSelectDefaultValue>(
              (e) => RoleSelectDefaultValue.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RoleSelectComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RoleSelectComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.roleSelect;
  final int? id;
  final String customId;
  final String? placeholder;
  final int? minValues;
  final int? maxValues;
  final bool? disabled;
  final bool? required_;
  final List<RoleSelectDefaultValue>? defaultValues;

  /// Converts a [RoleSelectComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'required': required_,
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    required_,
    listHash(defaultValues),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RoleSelectComponentForMessageRequest &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        required_ == other.required_ &&
        listsEqual(defaultValues, other.defaultValues);
  }
}

@immutable
final class StringSelectComponentForMessageRequest
    extends ActionRowComponentForMessageRequestComponentsInner {
  const StringSelectComponentForMessageRequest({
    required this.customId,
    required this.options,
    this.id,
    this.placeholder,
    this.minValues,
    this.maxValues,
    this.disabled,
    this.required_,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [StringSelectComponentForMessageRequest].
  factory StringSelectComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'StringSelectComponentForMessageRequest',
      json,
      () => StringSelectComponentForMessageRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        disabled: json['disabled'] as bool?,
        required_: json['required'] as bool?,
        options: (json['options'] as List)
            .map<StringSelectOptionForRequest>(
              (e) => StringSelectOptionForRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StringSelectComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StringSelectComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.stringSelect;
  final int? id;
  final String customId;
  final String? placeholder;
  final int? minValues;
  final int? maxValues;
  final bool? disabled;
  final bool? required_;
  final List<StringSelectOptionForRequest> options;

  /// Converts a [StringSelectComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'required': required_,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    required_,
    listHash(options),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StringSelectComponentForMessageRequest &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        required_ == other.required_ &&
        listsEqual(options, other.options);
  }
}

@immutable
final class UserSelectComponentForMessageRequest
    extends ActionRowComponentForMessageRequestComponentsInner {
  const UserSelectComponentForMessageRequest({
    required this.customId,
    this.id,
    this.placeholder,
    this.minValues,
    this.maxValues,
    this.disabled,
    this.required_,
    this.defaultValues,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UserSelectComponentForMessageRequest].
  factory UserSelectComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UserSelectComponentForMessageRequest',
      json,
      () => UserSelectComponentForMessageRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        disabled: json['disabled'] as bool?,
        required_: json['required'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<UserSelectDefaultValue>(
              (e) => UserSelectDefaultValue.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserSelectComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserSelectComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.userSelect;
  final int? id;
  final String customId;
  final String? placeholder;
  final int? minValues;
  final int? maxValues;
  final bool? disabled;
  final bool? required_;
  final List<UserSelectDefaultValue>? defaultValues;

  /// Converts a [UserSelectComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'required': required_,
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    required_,
    listHash(defaultValues),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserSelectComponentForMessageRequest &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        required_ == other.required_ &&
        listsEqual(defaultValues, other.defaultValues);
  }
}

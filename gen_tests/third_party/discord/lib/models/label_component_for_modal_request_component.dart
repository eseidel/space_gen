// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/checkbox_group_option_for_request.dart';
import 'package:discord/messages/radio_group_option_for_request.dart';
import 'package:discord/messages/string_select_option_for_request.dart';
import 'package:discord/messages/text_input_component_for_modal_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_select_default_value.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/mentionable_select_component_for_modal_request_default_values_inner.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/role_select_default_value.dart';
import 'package:discord/models/user_select_default_value.dart';
import 'package:meta/meta.dart';

sealed class LabelComponentForModalRequestComponent {
  const LabelComponentForModalRequestComponent();

  factory LabelComponentForModalRequestComponent.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      8 => ChannelSelectComponentForModalRequest.fromJson(json),
      23 => CheckboxComponentForModalRequest.fromJson(json),
      22 => CheckboxGroupComponentForModalRequest.fromJson(json),
      19 => FileUploadComponentForModalRequest.fromJson(json),
      7 => MentionableSelectComponentForModalRequest.fromJson(json),
      21 => RadioGroupComponentForModalRequest.fromJson(json),
      6 => RoleSelectComponentForModalRequest.fromJson(json),
      3 => StringSelectComponentForModalRequest.fromJson(json),
      4 =>
        LabelComponentForModalRequestComponentTextInputComponentForModalRequest(
          TextInputComponentForModalRequest.fromJson(json),
        ),
      5 => UserSelectComponentForModalRequest.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for LabelComponentForModalRequestComponent",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LabelComponentForModalRequestComponent? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return LabelComponentForModalRequestComponent.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class LabelComponentForModalRequestComponentTextInputComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const LabelComponentForModalRequestComponentTextInputComponentForModalRequest(
    this.value,
  );

  final TextInputComponentForModalRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is LabelComponentForModalRequestComponentTextInputComponentForModalRequest &&
        value == other.value;
  }
}

@immutable
final class ChannelSelectComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const ChannelSelectComponentForModalRequest({
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
  /// [ChannelSelectComponentForModalRequest].
  factory ChannelSelectComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChannelSelectComponentForModalRequest',
      json,
      () => ChannelSelectComponentForModalRequest(
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
  static ChannelSelectComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChannelSelectComponentForModalRequest.fromJson(json);
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

  /// Converts a [ChannelSelectComponentForModalRequest]
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
    return other is ChannelSelectComponentForModalRequest &&
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
final class CheckboxComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const CheckboxComponentForModalRequest({
    required this.customId,
    this.id,
    this.default_,
  });

  /// Converts a `Map<String, dynamic>` to a [CheckboxComponentForModalRequest].
  factory CheckboxComponentForModalRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckboxComponentForModalRequest',
      json,
      () => CheckboxComponentForModalRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        default_: json['default'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckboxComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CheckboxComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.checkbox;
  final int? id;
  final String customId;
  final bool? default_;

  /// Converts a [CheckboxComponentForModalRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'default': default_,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, customId, default_]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckboxComponentForModalRequest &&
        id == other.id &&
        customId == other.customId &&
        default_ == other.default_;
  }
}

@immutable
final class CheckboxGroupComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const CheckboxGroupComponentForModalRequest({
    required this.customId,
    required this.options,
    this.id,
    this.minValues,
    this.maxValues,
    this.required_,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CheckboxGroupComponentForModalRequest].
  factory CheckboxGroupComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CheckboxGroupComponentForModalRequest',
      json,
      () => CheckboxGroupComponentForModalRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        required_: json['required'] as bool?,
        options: (json['options'] as List)
            .map<CheckboxGroupOptionForRequest>(
              (e) => CheckboxGroupOptionForRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckboxGroupComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CheckboxGroupComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.checkboxGroup;
  final int? id;
  final String customId;
  final int? minValues;
  final int? maxValues;
  final bool? required_;
  final List<CheckboxGroupOptionForRequest> options;

  /// Converts a [CheckboxGroupComponentForModalRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'min_values': minValues,
      'max_values': maxValues,
      'required': required_,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    minValues,
    maxValues,
    required_,
    listHash(options),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckboxGroupComponentForModalRequest &&
        id == other.id &&
        customId == other.customId &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        required_ == other.required_ &&
        listsEqual(options, other.options);
  }
}

@immutable
final class FileUploadComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const FileUploadComponentForModalRequest({
    required this.customId,
    this.id,
    this.minValues,
    this.maxValues,
    this.required_,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [FileUploadComponentForModalRequest].
  factory FileUploadComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'FileUploadComponentForModalRequest',
      json,
      () => FileUploadComponentForModalRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        required_: json['required'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileUploadComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return FileUploadComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.fileUpload;
  final int? id;
  final String customId;
  final int? minValues;
  final int? maxValues;
  final bool? required_;

  /// Converts a [FileUploadComponentForModalRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'min_values': minValues,
      'max_values': maxValues,
      'required': required_,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, customId, minValues, maxValues, required_]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileUploadComponentForModalRequest &&
        id == other.id &&
        customId == other.customId &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        required_ == other.required_;
  }
}

@immutable
final class MentionableSelectComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const MentionableSelectComponentForModalRequest({
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
  /// [MentionableSelectComponentForModalRequest].
  factory MentionableSelectComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MentionableSelectComponentForModalRequest',
      json,
      () => MentionableSelectComponentForModalRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int?,
        maxValues: json['max_values'] as int?,
        disabled: json['disabled'] as bool?,
        required_: json['required'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<MentionableSelectComponentForModalRequestDefaultValuesInner>(
              (e) =>
                  MentionableSelectComponentForModalRequestDefaultValuesInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionableSelectComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MentionableSelectComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.mentionableSelect;
  final int? id;
  final String customId;
  final String? placeholder;
  final int? minValues;
  final int? maxValues;
  final bool? disabled;
  final bool? required_;
  final List<MentionableSelectComponentForModalRequestDefaultValuesInner>?
  defaultValues;

  /// Converts a [MentionableSelectComponentForModalRequest]
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
    return other is MentionableSelectComponentForModalRequest &&
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
final class RadioGroupComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const RadioGroupComponentForModalRequest({
    required this.customId,
    required this.options,
    this.id,
    this.required_,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RadioGroupComponentForModalRequest].
  factory RadioGroupComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RadioGroupComponentForModalRequest',
      json,
      () => RadioGroupComponentForModalRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        required_: json['required'] as bool?,
        options: (json['options'] as List)
            .map<RadioGroupOptionForRequest>(
              (e) => RadioGroupOptionForRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RadioGroupComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RadioGroupComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.radioGroup;
  final int? id;
  final String customId;
  final bool? required_;
  final List<RadioGroupOptionForRequest> options;

  /// Converts a [RadioGroupComponentForModalRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'required': required_,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, customId, required_, listHash(options)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RadioGroupComponentForModalRequest &&
        id == other.id &&
        customId == other.customId &&
        required_ == other.required_ &&
        listsEqual(options, other.options);
  }
}

@immutable
final class RoleSelectComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const RoleSelectComponentForModalRequest({
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
  /// [RoleSelectComponentForModalRequest].
  factory RoleSelectComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RoleSelectComponentForModalRequest',
      json,
      () => RoleSelectComponentForModalRequest(
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
  static RoleSelectComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RoleSelectComponentForModalRequest.fromJson(json);
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

  /// Converts a [RoleSelectComponentForModalRequest]
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
    return other is RoleSelectComponentForModalRequest &&
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
final class StringSelectComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const StringSelectComponentForModalRequest({
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
  /// [StringSelectComponentForModalRequest].
  factory StringSelectComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'StringSelectComponentForModalRequest',
      json,
      () => StringSelectComponentForModalRequest(
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
  static StringSelectComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StringSelectComponentForModalRequest.fromJson(json);
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

  /// Converts a [StringSelectComponentForModalRequest]
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
    return other is StringSelectComponentForModalRequest &&
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
final class UserSelectComponentForModalRequest
    extends LabelComponentForModalRequestComponent {
  const UserSelectComponentForModalRequest({
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
  /// [UserSelectComponentForModalRequest].
  factory UserSelectComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UserSelectComponentForModalRequest',
      json,
      () => UserSelectComponentForModalRequest(
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
  static UserSelectComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserSelectComponentForModalRequest.fromJson(json);
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

  /// Converts a [UserSelectComponentForModalRequest]
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
    return other is UserSelectComponentForModalRequest &&
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

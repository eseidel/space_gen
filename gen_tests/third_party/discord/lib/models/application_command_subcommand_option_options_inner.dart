// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/application_command_attachment_option.dart';
import 'package:discord/models/application_command_boolean_option.dart';
import 'package:discord/models/application_command_channel_option.dart';
import 'package:discord/models/application_command_integer_option.dart';
import 'package:discord/models/application_command_mentionable_option.dart';
import 'package:discord/models/application_command_number_option.dart';
import 'package:discord/models/application_command_role_option.dart';
import 'package:discord/models/application_command_string_option.dart';
import 'package:discord/models/application_command_user_option.dart';
import 'package:meta/meta.dart';

sealed class ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInner();

  factory ApplicationCommandSubcommandOptionOptionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      11 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandAttachmentOption(
          ApplicationCommandAttachmentOption.fromJson(json),
        ),
      5 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandBooleanOption(
          ApplicationCommandBooleanOption.fromJson(json),
        ),
      7 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandChannelOption(
          ApplicationCommandChannelOption.fromJson(json),
        ),
      4 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandIntegerOption(
          ApplicationCommandIntegerOption.fromJson(json),
        ),
      9 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandMentionableOption(
          ApplicationCommandMentionableOption.fromJson(json),
        ),
      10 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandNumberOption(
          ApplicationCommandNumberOption.fromJson(json),
        ),
      8 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandRoleOption(
          ApplicationCommandRoleOption.fromJson(json),
        ),
      3 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandStringOption(
          ApplicationCommandStringOption.fromJson(json),
        ),
      6 =>
        ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandUserOption(
          ApplicationCommandUserOption.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ApplicationCommandSubcommandOptionOptionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandSubcommandOptionOptionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandSubcommandOptionOptionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandAttachmentOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandAttachmentOption(
    this.value,
  );

  final ApplicationCommandAttachmentOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandAttachmentOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandBooleanOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandBooleanOption(
    this.value,
  );

  final ApplicationCommandBooleanOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandBooleanOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandChannelOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandChannelOption(
    this.value,
  );

  final ApplicationCommandChannelOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandChannelOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandIntegerOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandIntegerOption(
    this.value,
  );

  final ApplicationCommandIntegerOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandIntegerOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandMentionableOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandMentionableOption(
    this.value,
  );

  final ApplicationCommandMentionableOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandMentionableOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandNumberOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandNumberOption(
    this.value,
  );

  final ApplicationCommandNumberOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandNumberOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandRoleOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandRoleOption(
    this.value,
  );

  final ApplicationCommandRoleOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandRoleOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandStringOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandStringOption(
    this.value,
  );

  final ApplicationCommandStringOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandStringOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandUserOption
    extends ApplicationCommandSubcommandOptionOptionsInner {
  const ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandUserOption(
    this.value,
  );

  final ApplicationCommandUserOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandSubcommandOptionOptionsInnerApplicationCommandUserOption &&
        value == other.value;
  }
}

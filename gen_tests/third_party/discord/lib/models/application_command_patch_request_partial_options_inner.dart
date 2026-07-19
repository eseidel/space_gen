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
import 'package:discord/models/application_command_subcommand_group_option.dart';
import 'package:discord/models/application_command_subcommand_option.dart';
import 'package:discord/models/application_command_user_option.dart';
import 'package:meta/meta.dart';

sealed class ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInner();

  factory ApplicationCommandPatchRequestPartialOptionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      11 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandAttachmentOption(
          ApplicationCommandAttachmentOption.fromJson(json),
        ),
      5 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandBooleanOption(
          ApplicationCommandBooleanOption.fromJson(json),
        ),
      7 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandChannelOption(
          ApplicationCommandChannelOption.fromJson(json),
        ),
      4 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandIntegerOption(
          ApplicationCommandIntegerOption.fromJson(json),
        ),
      9 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandMentionableOption(
          ApplicationCommandMentionableOption.fromJson(json),
        ),
      10 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandNumberOption(
          ApplicationCommandNumberOption.fromJson(json),
        ),
      8 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandRoleOption(
          ApplicationCommandRoleOption.fromJson(json),
        ),
      3 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandStringOption(
          ApplicationCommandStringOption.fromJson(json),
        ),
      2 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandGroupOption(
          ApplicationCommandSubcommandGroupOption.fromJson(json),
        ),
      1 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandOption(
          ApplicationCommandSubcommandOption.fromJson(json),
        ),
      6 =>
        ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandUserOption(
          ApplicationCommandUserOption.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ApplicationCommandPatchRequestPartialOptionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandPatchRequestPartialOptionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandPatchRequestPartialOptionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandAttachmentOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandAttachmentOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandAttachmentOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandBooleanOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandBooleanOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandBooleanOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandChannelOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandChannelOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandChannelOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandIntegerOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandIntegerOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandIntegerOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandMentionableOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandMentionableOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandMentionableOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandNumberOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandNumberOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandNumberOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandRoleOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandRoleOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandRoleOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandStringOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandStringOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandStringOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandGroupOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandGroupOption(
    this.value,
  );

  final ApplicationCommandSubcommandGroupOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandGroupOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandOption(
    this.value,
  );

  final ApplicationCommandSubcommandOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandSubcommandOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandUserOption
    extends ApplicationCommandPatchRequestPartialOptionsInner {
  const ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandUserOption(
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
            is ApplicationCommandPatchRequestPartialOptionsInnerApplicationCommandUserOption &&
        value == other.value;
  }
}

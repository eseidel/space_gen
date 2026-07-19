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

sealed class ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInner();

  factory ApplicationCommandUpdateRequestOptionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      11 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandAttachmentOption(
          ApplicationCommandAttachmentOption.fromJson(json),
        ),
      5 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandBooleanOption(
          ApplicationCommandBooleanOption.fromJson(json),
        ),
      7 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandChannelOption(
          ApplicationCommandChannelOption.fromJson(json),
        ),
      4 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandIntegerOption(
          ApplicationCommandIntegerOption.fromJson(json),
        ),
      9 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandMentionableOption(
          ApplicationCommandMentionableOption.fromJson(json),
        ),
      10 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandNumberOption(
          ApplicationCommandNumberOption.fromJson(json),
        ),
      8 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandRoleOption(
          ApplicationCommandRoleOption.fromJson(json),
        ),
      3 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandStringOption(
          ApplicationCommandStringOption.fromJson(json),
        ),
      2 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandGroupOption(
          ApplicationCommandSubcommandGroupOption.fromJson(json),
        ),
      1 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandOption(
          ApplicationCommandSubcommandOption.fromJson(json),
        ),
      6 =>
        ApplicationCommandUpdateRequestOptionsInnerApplicationCommandUserOption(
          ApplicationCommandUserOption.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ApplicationCommandUpdateRequestOptionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandUpdateRequestOptionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandUpdateRequestOptionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandAttachmentOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandAttachmentOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandAttachmentOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandBooleanOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandBooleanOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandBooleanOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandChannelOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandChannelOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandChannelOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandIntegerOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandIntegerOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandIntegerOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandMentionableOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandMentionableOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandMentionableOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandNumberOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandNumberOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandNumberOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandRoleOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandRoleOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandRoleOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandStringOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandStringOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandStringOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandGroupOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandGroupOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandGroupOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandSubcommandOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandUpdateRequestOptionsInnerApplicationCommandUserOption
    extends ApplicationCommandUpdateRequestOptionsInner {
  const ApplicationCommandUpdateRequestOptionsInnerApplicationCommandUserOption(
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
            is ApplicationCommandUpdateRequestOptionsInnerApplicationCommandUserOption &&
        value == other.value;
  }
}

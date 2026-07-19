// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class IssuesCreateRequestMilestone {
  const IssuesCreateRequestMilestone();

  factory IssuesCreateRequestMilestone.fromJson(dynamic json) {
    return switch (json) {
      final String v => IssuesCreateRequestMilestoneString(v),
      final int v => IssuesCreateRequestMilestoneInt(v),
      _ => throw FormatException(
        'Unsupported shape for IssuesCreateRequestMilestone: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesCreateRequestMilestone? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssuesCreateRequestMilestone.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class IssuesCreateRequestMilestoneString
    extends IssuesCreateRequestMilestone {
  const IssuesCreateRequestMilestoneString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesCreateRequestMilestoneString && value == other.value;
  }
}

@immutable
final class IssuesCreateRequestMilestoneInt
    extends IssuesCreateRequestMilestone {
  const IssuesCreateRequestMilestoneInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesCreateRequestMilestoneInt && value == other.value;
  }
}

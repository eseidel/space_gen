import 'package:meta/meta.dart';

/// The title of the issue.
sealed class IssuesUpdateRequestTitle {
  const IssuesUpdateRequestTitle();

  factory IssuesUpdateRequestTitle.fromJson(dynamic json) {
    return switch (json) {
      final String v => IssuesUpdateRequestTitleString(v),
      final int v => IssuesUpdateRequestTitleInt(v),
      _ => throw FormatException(
        'Unsupported shape for IssuesUpdateRequestTitle: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesUpdateRequestTitle? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateRequestTitle.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class IssuesUpdateRequestTitleString extends IssuesUpdateRequestTitle {
  const IssuesUpdateRequestTitleString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesUpdateRequestTitleString && value == other.value;
  }
}

@immutable
final class IssuesUpdateRequestTitleInt extends IssuesUpdateRequestTitle {
  const IssuesUpdateRequestTitleInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesUpdateRequestTitleInt && value == other.value;
  }
}

// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';

/// The title of the issue.
sealed class IssuesCreateRequestTitle {
  const IssuesCreateRequestTitle();

  factory IssuesCreateRequestTitle.fromJson(dynamic json) {
    return switch (json) {
      final String v => IssuesCreateRequestTitleString(v),
      final int v => IssuesCreateRequestTitleInt(v),
      _ => throw FormatException(
        'Unsupported shape for IssuesCreateRequestTitle: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesCreateRequestTitle? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssuesCreateRequestTitle.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class IssuesCreateRequestTitleString extends IssuesCreateRequestTitle {
  const IssuesCreateRequestTitleString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesCreateRequestTitleString && value == other.value;
  }
}

@immutable
final class IssuesCreateRequestTitleInt extends IssuesCreateRequestTitle {
  const IssuesCreateRequestTitleInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesCreateRequestTitleInt && value == other.value;
  }
}

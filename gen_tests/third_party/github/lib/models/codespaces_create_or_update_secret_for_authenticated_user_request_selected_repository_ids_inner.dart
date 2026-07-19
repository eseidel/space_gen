// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner {
  const CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner();

  factory CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner.fromJson(
    dynamic json,
  ) {
    return switch (json) {
      final int v =>
        CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerInt(
          v,
        ),
      final String v =>
        CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerString(
          v,
        ),
      _ => throw FormatException(
        'Unsupported shape for CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner?
  maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner.fromJson(
      json,
    );
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerInt
    extends
        CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner {
  const CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerInt(
    this.value,
  );

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerInt &&
        value == other.value;
  }
}

@immutable
final class CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerString
    extends
        CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner {
  const CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerString(
    this.value,
  );

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInnerString &&
        value == other.value;
  }
}

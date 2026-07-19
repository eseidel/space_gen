import 'package:meta/meta.dart';

/// The ID of the GitHub Pages deployment. This is the Git SHA of the deployed
/// commit.
sealed class PageDeploymentId {
  const PageDeploymentId();

  factory PageDeploymentId.fromJson(dynamic json) {
    return switch (json) {
      final int v => PageDeploymentIdInt(v),
      final String v => PageDeploymentIdString(v),
      _ => throw FormatException(
        'Unsupported shape for PageDeploymentId: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PageDeploymentId? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return PageDeploymentId.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class PageDeploymentIdInt extends PageDeploymentId {
  const PageDeploymentIdInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PageDeploymentIdInt && value == other.value;
  }
}

@immutable
final class PageDeploymentIdString extends PageDeploymentId {
  const PageDeploymentIdString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PageDeploymentIdString && value == other.value;
  }
}

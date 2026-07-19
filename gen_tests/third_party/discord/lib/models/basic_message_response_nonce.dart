import 'package:meta/meta.dart';

sealed class BasicMessageResponseNonce {
  const BasicMessageResponseNonce();

  factory BasicMessageResponseNonce.fromJson(dynamic json) {
    return switch (json) {
      final int v => BasicMessageResponseNonceInt(v),
      final String v => BasicMessageResponseNonceString(v),
      _ => throw FormatException(
        'Unsupported shape for BasicMessageResponseNonce: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BasicMessageResponseNonce? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return BasicMessageResponseNonce.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class BasicMessageResponseNonceInt extends BasicMessageResponseNonce {
  const BasicMessageResponseNonceInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasicMessageResponseNonceInt && value == other.value;
  }
}

@immutable
final class BasicMessageResponseNonceString extends BasicMessageResponseNonce {
  const BasicMessageResponseNonceString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasicMessageResponseNonceString && value == other.value;
  }
}

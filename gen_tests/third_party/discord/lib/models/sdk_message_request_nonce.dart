import 'package:meta/meta.dart';

sealed class SdkMessageRequestNonce {
  const SdkMessageRequestNonce();

  factory SdkMessageRequestNonce.fromJson(dynamic json) {
    return switch (json) {
      final int v => SdkMessageRequestNonceInt(v),
      final String v => SdkMessageRequestNonceString(v),
      _ => throw FormatException(
        'Unsupported shape for SdkMessageRequestNonce: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SdkMessageRequestNonce? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return SdkMessageRequestNonce.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class SdkMessageRequestNonceInt extends SdkMessageRequestNonce {
  const SdkMessageRequestNonceInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SdkMessageRequestNonceInt && value == other.value;
  }
}

@immutable
final class SdkMessageRequestNonceString extends SdkMessageRequestNonce {
  const SdkMessageRequestNonceString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SdkMessageRequestNonceString && value == other.value;
  }
}

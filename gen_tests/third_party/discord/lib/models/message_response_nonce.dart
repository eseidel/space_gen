import 'package:meta/meta.dart';

sealed class MessageResponseNonce {
  const MessageResponseNonce();

  factory MessageResponseNonce.fromJson(dynamic json) {
    return switch (json) {
      final int v => MessageResponseNonceInt(v),
      final String v => MessageResponseNonceString(v),
      _ => throw FormatException(
        'Unsupported shape for MessageResponseNonce: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageResponseNonce? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return MessageResponseNonce.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class MessageResponseNonceInt extends MessageResponseNonce {
  const MessageResponseNonceInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseNonceInt && value == other.value;
  }
}

@immutable
final class MessageResponseNonceString extends MessageResponseNonce {
  const MessageResponseNonceString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseNonceString && value == other.value;
  }
}

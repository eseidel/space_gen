import 'package:meta/meta.dart';

sealed class MessageCreateRequestNonce {
  const MessageCreateRequestNonce();

  factory MessageCreateRequestNonce.fromJson(dynamic json) {
    return switch (json) {
      final int v => MessageCreateRequestNonceInt(v),
      final String v => MessageCreateRequestNonceString(v),
      _ => throw FormatException(
        'Unsupported shape for MessageCreateRequestNonce: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageCreateRequestNonce? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return MessageCreateRequestNonce.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class MessageCreateRequestNonceInt extends MessageCreateRequestNonce {
  const MessageCreateRequestNonceInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageCreateRequestNonceInt && value == other.value;
  }
}

@immutable
final class MessageCreateRequestNonceString extends MessageCreateRequestNonce {
  const MessageCreateRequestNonceString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageCreateRequestNonceString && value == other.value;
  }
}

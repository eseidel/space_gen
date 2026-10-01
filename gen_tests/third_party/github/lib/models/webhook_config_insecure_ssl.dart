// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';

sealed class WebhookConfigInsecureSsl {
  const WebhookConfigInsecureSsl();

  factory WebhookConfigInsecureSsl.fromJson(dynamic json) {
    return switch (json) {
      final String v => WebhookConfigInsecureSslString(v),
      final num v => WebhookConfigInsecureSslNum(v),
      _ => throw FormatException(
        'Unsupported shape for WebhookConfigInsecureSsl: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookConfigInsecureSsl? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return WebhookConfigInsecureSsl.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class WebhookConfigInsecureSslString extends WebhookConfigInsecureSsl {
  const WebhookConfigInsecureSslString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WebhookConfigInsecureSslString && value == other.value;
  }
}

@immutable
final class WebhookConfigInsecureSslNum extends WebhookConfigInsecureSsl {
  const WebhookConfigInsecureSslNum(this.value);

  final num value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WebhookConfigInsecureSslNum && value == other.value;
  }
}

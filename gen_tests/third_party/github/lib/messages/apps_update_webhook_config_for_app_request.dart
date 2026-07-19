// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/webhook_config_content_type.dart';
import 'package:github/models/webhook_config_insecure_ssl.dart';
import 'package:github/models/webhook_config_secret.dart';
import 'package:github/models/webhook_config_url.dart';
import 'package:meta/meta.dart';

@immutable
class AppsUpdateWebhookConfigForAppRequest {
  const AppsUpdateWebhookConfigForAppRequest({
    this.url,
    this.contentType,
    this.secret,
    this.insecureSsl,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [AppsUpdateWebhookConfigForAppRequest].
  factory AppsUpdateWebhookConfigForAppRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'AppsUpdateWebhookConfigForAppRequest',
      json,
      () => AppsUpdateWebhookConfigForAppRequest(
        url: WebhookConfigUrl.maybeFromJson(json['url'] as String?),
        contentType: WebhookConfigContentType.maybeFromJson(
          json['content_type'] as String?,
        ),
        secret: WebhookConfigSecret.maybeFromJson(json['secret'] as String?),
        insecureSsl: WebhookConfigInsecureSsl.maybeFromJson(
          json['insecure_ssl'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsUpdateWebhookConfigForAppRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppsUpdateWebhookConfigForAppRequest.fromJson(json);
  }

  /// The URL to which the payloads will be delivered.
  /// Example: `'https://example.com/webhook'`
  final WebhookConfigUrl? url;

  /// The media type used to serialize the payloads. Supported values include
  /// `json` and `form`. The default is `form`.
  /// Example: `'"json"'`
  final WebhookConfigContentType? contentType;

  /// If provided, the `secret` will be used as the `key` to generate the HMAC
  /// hex digest value for [delivery signature
  /// headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
  /// Example: `'"********"'`
  final WebhookConfigSecret? secret;
  final WebhookConfigInsecureSsl? insecureSsl;

  /// Converts an [AppsUpdateWebhookConfigForAppRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (url != null) 'url': url?.toJson(),
      if (contentType != null) 'content_type': contentType?.toJson(),
      if (secret != null) 'secret': secret?.toJson(),
      if (insecureSsl != null) 'insecure_ssl': insecureSsl?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([url, contentType, secret, insecureSsl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsUpdateWebhookConfigForAppRequest &&
        url == other.url &&
        contentType == other.contentType &&
        secret == other.secret &&
        insecureSsl == other.insecureSsl;
  }
}

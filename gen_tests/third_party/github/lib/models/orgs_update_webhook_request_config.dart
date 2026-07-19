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

/// {@template orgs_update_webhook_request_config}
/// Key/value pairs to provide settings for this webhook.
/// {@endtemplate}
@immutable
class OrgsUpdateWebhookRequestConfig {
  /// {@macro orgs_update_webhook_request_config}
  const OrgsUpdateWebhookRequestConfig({
    required this.url,
    this.contentType,
    this.secret,
    this.insecureSsl,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgsUpdateWebhookRequestConfig].
  factory OrgsUpdateWebhookRequestConfig.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsUpdateWebhookRequestConfig',
      json,
      () => OrgsUpdateWebhookRequestConfig(
        url: WebhookConfigUrl.fromJson(json['url'] as String),
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
  static OrgsUpdateWebhookRequestConfig? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsUpdateWebhookRequestConfig.fromJson(json);
  }

  /// The URL to which the payloads will be delivered.
  /// Example: `'https://example.com/webhook'`
  final WebhookConfigUrl url;

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

  /// Converts an [OrgsUpdateWebhookRequestConfig] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toJson(),
      'content_type': contentType?.toJson(),
      'secret': secret?.toJson(),
      'insecure_ssl': insecureSsl?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([url, contentType, secret, insecureSsl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdateWebhookRequestConfig &&
        url == other.url &&
        contentType == other.contentType &&
        secret == other.secret &&
        insecureSsl == other.insecureSsl;
  }
}

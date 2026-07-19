import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UnfurledMediaRequest {
  const UnfurledMediaRequest({required this.url});

  /// Converts a `Map<String, dynamic>` to a [UnfurledMediaRequest].
  factory UnfurledMediaRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UnfurledMediaRequest',
      json,
      () => UnfurledMediaRequest(url: Uri.parse(json['url'] as String)),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UnfurledMediaRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UnfurledMediaRequest.fromJson(json);
  }

  final Uri url;

  /// Converts a [UnfurledMediaRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url.toString()};
  }

  @override
  int get hashCode => url.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnfurledMediaRequest && url == other.url;
  }
}

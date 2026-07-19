import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class StatusCheckPolicyChecksInner {
  const StatusCheckPolicyChecksInner({
    required this.context,
    required this.appId,
  });

  /// Converts a `Map<String, dynamic>` to a [StatusCheckPolicyChecksInner].
  factory StatusCheckPolicyChecksInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StatusCheckPolicyChecksInner',
      json,
      () => StatusCheckPolicyChecksInner(
        context: json['context'] as String,
        appId: checkedKey(json, 'app_id') as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StatusCheckPolicyChecksInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StatusCheckPolicyChecksInner.fromJson(json);
  }

  /// Example: `'continuous-integration/travis-ci'`
  final String context;
  final int? appId;

  /// Converts a [StatusCheckPolicyChecksInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'context': context, 'app_id': appId};
  }

  @override
  int get hashCode => Object.hashAll([context, appId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StatusCheckPolicyChecksInner &&
        context == other.context &&
        appId == other.appId;
  }
}

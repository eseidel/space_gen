// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningAlertInstanceMessage {
  const CodeScanningAlertInstanceMessage({this.text});

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAlertInstanceMessage].
  factory CodeScanningAlertInstanceMessage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAlertInstanceMessage',
      json,
      () => CodeScanningAlertInstanceMessage(text: json['text'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAlertInstanceMessage? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertInstanceMessage.fromJson(json);
  }

  final String? text;

  /// Converts a [CodeScanningAlertInstanceMessage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'text': ?text};
  }

  @override
  int get hashCode => text.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAlertInstanceMessage && text == other.text;
  }
}

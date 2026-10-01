// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchWithProtectionLinks {
  const BranchWithProtectionLinks({required this.html, required this.self});

  /// Converts a `Map<String, dynamic>` to a [BranchWithProtectionLinks].
  factory BranchWithProtectionLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchWithProtectionLinks',
      json,
      () => BranchWithProtectionLinks(
        html: json['html'] as String,
        self: Uri.parse(json['self'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchWithProtectionLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BranchWithProtectionLinks.fromJson(json);
  }

  final String html;
  final Uri self;

  /// Converts a [BranchWithProtectionLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'html': html, 'self': self.toString()};
  }

  @override
  int get hashCode => Object.hashAll([html, self]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchWithProtectionLinks &&
        html == other.html &&
        self == other.self;
  }
}

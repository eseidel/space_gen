import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ContributorActivityWeeksInner {
  const ContributorActivityWeeksInner({this.w, this.a, this.d, this.c});

  /// Converts a `Map<String, dynamic>` to a [ContributorActivityWeeksInner].
  factory ContributorActivityWeeksInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContributorActivityWeeksInner',
      json,
      () => ContributorActivityWeeksInner(
        w: json['w'] as int?,
        a: json['a'] as int?,
        d: json['d'] as int?,
        c: json['c'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContributorActivityWeeksInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ContributorActivityWeeksInner.fromJson(json);
  }

  final int? w;
  final int? a;
  final int? d;
  final int? c;

  /// Converts a [ContributorActivityWeeksInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'w': ?w, 'a': ?a, 'd': ?d, 'c': ?c};
  }

  @override
  int get hashCode => Object.hashAll([w, a, d, c]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContributorActivityWeeksInner &&
        w == other.w &&
        a == other.a &&
        d == other.d &&
        c == other.c;
  }
}

import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template reaction_rollup}
/// Reaction Rollup
/// {@endtemplate}
@immutable
class ReactionRollup {
  /// {@macro reaction_rollup}
  const ReactionRollup({
    required this.url,
    required this.totalCount,
    required this.plus1,
    required this.minus1,
    required this.laugh,
    required this.confused,
    required this.heart,
    required this.hooray,
    required this.eyes,
    required this.rocket,
  });

  /// Converts a `Map<String, dynamic>` to a [ReactionRollup].
  factory ReactionRollup.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReactionRollup',
      json,
      () => ReactionRollup(
        url: Uri.parse(json['url'] as String),
        totalCount: json['total_count'] as int,
        plus1: json['+1'] as int,
        minus1: json['-1'] as int,
        laugh: json['laugh'] as int,
        confused: json['confused'] as int,
        heart: json['heart'] as int,
        hooray: json['hooray'] as int,
        eyes: json['eyes'] as int,
        rocket: json['rocket'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionRollup? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReactionRollup.fromJson(json);
  }

  final Uri url;
  final int totalCount;
  final int plus1;
  final int minus1;
  final int laugh;
  final int confused;
  final int heart;
  final int hooray;
  final int eyes;
  final int rocket;

  /// Converts a [ReactionRollup] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'total_count': totalCount,
      '+1': plus1,
      '-1': minus1,
      'laugh': laugh,
      'confused': confused,
      'heart': heart,
      'hooray': hooray,
      'eyes': eyes,
      'rocket': rocket,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    totalCount,
    plus1,
    minus1,
    laugh,
    confused,
    heart,
    hooray,
    eyes,
    rocket,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionRollup &&
        url == other.url &&
        totalCount == other.totalCount &&
        plus1 == other.plus1 &&
        minus1 == other.minus1 &&
        laugh == other.laugh &&
        confused == other.confused &&
        heart == other.heart &&
        hooray == other.hooray &&
        eyes == other.eyes &&
        rocket == other.rocket;
  }
}

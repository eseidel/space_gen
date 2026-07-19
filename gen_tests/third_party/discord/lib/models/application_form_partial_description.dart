import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationFormPartialDescription {
  const ApplicationFormPartialDescription({
    required this.default_,
    this.localizations,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationFormPartialDescription].
  factory ApplicationFormPartialDescription.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationFormPartialDescription',
      json,
      () => ApplicationFormPartialDescription(
        default_: json['default'] as String,
        localizations: (json['localizations'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationFormPartialDescription? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationFormPartialDescription.fromJson(json);
  }

  final String default_;
  final Map<String, String>? localizations;

  /// Converts an [ApplicationFormPartialDescription]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'default': default_, 'localizations': localizations};
  }

  @override
  int get hashCode => Object.hashAll([default_, mapHash(localizations)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationFormPartialDescription &&
        default_ == other.default_ &&
        mapsEqual(localizations, other.localizations);
  }
}

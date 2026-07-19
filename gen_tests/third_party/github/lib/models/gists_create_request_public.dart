import 'package:github/models/gists_create_request_public_one_of_1.dart';
import 'package:meta/meta.dart';

sealed class GistsCreateRequestPublic {
  const GistsCreateRequestPublic();

  factory GistsCreateRequestPublic.fromJson(dynamic json) {
    return switch (json) {
      final bool v => GistsCreateRequestPublicBool(v),
      final String v => GistsCreateRequestPublicVariant1(
        GistsCreateRequestPublicOneOf1.fromJson(v),
      ),
      _ => throw FormatException(
        'Unsupported shape for GistsCreateRequestPublic: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsCreateRequestPublic? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return GistsCreateRequestPublic.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class GistsCreateRequestPublicBool extends GistsCreateRequestPublic {
  // The wrapper has a single positional arg by design — naming it
  // would force `Wrapper(value: x)` at every call site, which buys
  // nothing for a one-field shim.
  // ignore: avoid_positional_boolean_parameters
  const GistsCreateRequestPublicBool(this.value);

  final bool value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsCreateRequestPublicBool && value == other.value;
  }
}

@immutable
final class GistsCreateRequestPublicVariant1 extends GistsCreateRequestPublic {
  const GistsCreateRequestPublicVariant1(this.value);

  final GistsCreateRequestPublicOneOf1 value;

  @override
  dynamic toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsCreateRequestPublicVariant1 && value == other.value;
  }
}

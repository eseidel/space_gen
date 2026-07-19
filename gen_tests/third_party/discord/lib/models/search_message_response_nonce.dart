import 'package:meta/meta.dart';

sealed class SearchMessageResponseNonce {
  const SearchMessageResponseNonce();

  factory SearchMessageResponseNonce.fromJson(dynamic json) {
    return switch (json) {
      final int v => SearchMessageResponseNonceInt(v),
      final String v => SearchMessageResponseNonceString(v),
      _ => throw FormatException(
        'Unsupported shape for SearchMessageResponseNonce: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchMessageResponseNonce? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return SearchMessageResponseNonce.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class SearchMessageResponseNonceInt extends SearchMessageResponseNonce {
  const SearchMessageResponseNonceInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchMessageResponseNonceInt && value == other.value;
  }
}

@immutable
final class SearchMessageResponseNonceString
    extends SearchMessageResponseNonce {
  const SearchMessageResponseNonceString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchMessageResponseNonceString && value == other.value;
  }
}

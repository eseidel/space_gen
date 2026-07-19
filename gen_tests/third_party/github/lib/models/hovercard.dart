import 'package:github/model_helpers.dart';
import 'package:github/models/hovercard_contexts_inner.dart';
import 'package:meta/meta.dart';

/// {@template hovercard}
/// Hovercard
/// Hovercard
/// {@endtemplate}
@immutable
class Hovercard {
  /// {@macro hovercard}
  const Hovercard({required this.contexts});

  /// Converts a `Map<String, dynamic>` to a [Hovercard].
  factory Hovercard.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Hovercard',
      json,
      () => Hovercard(
        contexts: (json['contexts'] as List)
            .map<HovercardContextsInner>(
              (e) => HovercardContextsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Hovercard? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Hovercard.fromJson(json);
  }

  final List<HovercardContextsInner> contexts;

  /// Converts a [Hovercard] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'contexts': contexts.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(contexts).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Hovercard && listsEqual(contexts, other.contexts);
  }
}

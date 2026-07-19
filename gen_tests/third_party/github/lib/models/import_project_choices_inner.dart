import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ImportProjectChoicesInner {
  const ImportProjectChoicesInner({this.vcs, this.tfvcProject, this.humanName});

  /// Converts a `Map<String, dynamic>` to an [ImportProjectChoicesInner].
  factory ImportProjectChoicesInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ImportProjectChoicesInner',
      json,
      () => ImportProjectChoicesInner(
        vcs: json['vcs'] as String?,
        tfvcProject: json['tfvc_project'] as String?,
        humanName: json['human_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ImportProjectChoicesInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ImportProjectChoicesInner.fromJson(json);
  }

  final String? vcs;
  final String? tfvcProject;
  final String? humanName;

  /// Converts an [ImportProjectChoicesInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'vcs': vcs, 'tfvc_project': tfvcProject, 'human_name': humanName};
  }

  @override
  int get hashCode => Object.hashAll([vcs, tfvcProject, humanName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ImportProjectChoicesInner &&
        vcs == other.vcs &&
        tfvcProject == other.tfvcProject &&
        humanName == other.humanName;
  }
}

import 'package:form_urlencoded/model_helpers.dart';

class EditProductRequest {
  EditProductRequest({
    required this.code,
    this.brands = const [],
    this.labels = const [],
  });

  /// Converts a `Map<String, dynamic>` to an [EditProductRequest].
  factory EditProductRequest.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'EditProductRequest',
      json,
      () => EditProductRequest(
        code: json['code'] as String,
        brands: (json['brands'] as List).cast<String>(),
        labels: (json['labels'] as List?)?.cast<String>() ?? const [],
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EditProductRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EditProductRequest.fromJson(json);
  }

  String code;
  List<String> brands;
  List<String> labels;

  /// Converts an [EditProductRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code, 'brands': brands, 'labels': labels};
  }

  @override
  int get hashCode =>
      Object.hashAll([code, listHash(brands), listHash(labels)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EditProductRequest &&
        code == other.code &&
        listsEqual(brands, other.brands) &&
        listsEqual(labels, other.labels);
  }
}

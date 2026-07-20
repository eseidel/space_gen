import 'package:multipart/model_helpers.dart';

class UploadArrayFieldsRequest {
  UploadArrayFieldsRequest({
    this.brands = const [],
    this.labels = const [],
    this.counts = const [],
  });

  /// Converts a `Map<String, dynamic>` to a [UploadArrayFieldsRequest].
  factory UploadArrayFieldsRequest.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'UploadArrayFieldsRequest',
      json,
      () => UploadArrayFieldsRequest(
        brands: (json['brands'] as List).cast<String>(),
        labels: (json['labels'] as List?)?.cast<String>() ?? const [],
        counts: (json['counts'] as List).cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadArrayFieldsRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UploadArrayFieldsRequest.fromJson(json);
  }

  List<String> brands;
  List<String> labels;
  List<int> counts;

  /// Converts a [UploadArrayFieldsRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'brands': brands, 'labels': labels, 'counts': counts};
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(brands), listHash(labels), listHash(counts)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadArrayFieldsRequest &&
        listsEqual(brands, other.brands) &&
        listsEqual(labels, other.labels) &&
        listsEqual(counts, other.counts);
  }
}

import 'package:meta/meta.dart';
import 'package:spacetraders/model/get_my_account200_response_data_account.dart';

@immutable
class GetMyAccount200ResponseData {
  const GetMyAccount200ResponseData({required this.account});

  factory GetMyAccount200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetMyAccount200ResponseData(
      account: GetMyAccount200ResponseDataAccount.fromJson(
        json['account'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyAccount200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetMyAccount200ResponseData.fromJson(json);
  }

  final GetMyAccount200ResponseDataAccount account;

  Map<String, dynamic> toJson() {
    return {'account': account.toJson()};
  }

  @override
  int get hashCode => account.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyAccount200ResponseData && account == other.account;
  }
}

import 'package:spacetraders/model/get_my_account200_response_data_account.dart';

class GetMyAccount200ResponseData {
  GetMyAccount200ResponseData({required this.account});

  factory GetMyAccount200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetMyAccount200ResponseData(
      account: GetMyAccount200ResponseDataAccount.fromJson(
        json['account'] as Map<String, dynamic>,
      ),
    );
  }

  final GetMyAccount200ResponseDataAccount account;

  Map<String, dynamic> toJson() {
    return {'account': account.toJson()};
  }
}

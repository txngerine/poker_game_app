import 'package:dio/dio.dart';
import 'package:pokerpad/model/withdraw_request_model.dart';
import 'package:pokerpad/model/withdraw_response_model.dart';

class CashierController {
  final String baseUrl =
      "http://3.6.170.253:1080/server.php/api/v1/redeem?XDEBUG_SESSION_START=netbeans-xdebug";

  Future<WithdrawResponseModel> postWithdraw(
      WithdrawRequestModel requestModel) async {
    try {
      print("Sending request with data: ${requestModel.toJson()}");

      final response = await Dio().post(
        baseUrl,
        data: requestModel.toJson(),
        options: Options(validateStatus: (status) => true),
      );

      print("Raw API Response: ${response.data}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("API Request Successful");
        return WithdrawResponseModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusMessage}, Data: ${response.data}");
        return WithdrawResponseModel(
          status: "FAIL",
          messages: response.statusMessage ?? "Unknown API Error",
        );
      }
    } catch (e) {
      print("Exception: $e");
      return WithdrawResponseModel(
        status: "FAIL",
        messages: "API Controller Error: $e",
      );
    }
  }
}

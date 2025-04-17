import 'package:dio/dio.dart';
import 'package:pokerpad/model/transfer_request_model.dart';
import 'package:pokerpad/model/transfer_response_model.dart';

class TransferController {
  final String url =
      "http://3.6.170.253:1080/server.php/api/v1/player-transaction?XDEBUG_SESSION_START=netbeans-xdebug";

  Future<TransferResponseModel?> amountTransfer(
      TransferRequestModel requestModel) async {
    try {
      print("Sending request with data: ${requestModel.toJson()}");

      final response = await Dio().post(
        url,
        data: requestModel.toJson(),
        options: Options(validateStatus: (_) => true),
      );

      print("Raw API Response: ${response.data}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("success transfer controller");
        return TransferResponseModel.fromJson(response.data);
      } else {
        print("fail transfer controller");
        // return TransferResponseModel(
        //   status: "FAIL",
        //   messages: {"error": response.statusMessage ?? "Unknown API Error"},
        // );
        return TransferResponseModel.fromJson(response.data);
      }
    } catch (e) {
      print("Exception: $e");
      return TransferResponseModel(
        status: "FAIL",
        messages: {"error": "Exception occurred during API call"},
      );
    }
  }
}

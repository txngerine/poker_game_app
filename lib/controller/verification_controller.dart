import 'package:dio/dio.dart';
import 'package:pokerpad/model/verification_request_model.dart';
import 'package:pokerpad/model/verification_response_model.dart';

class VerificationController {
  Future<VerificationResponseModel?> verify(
      VerificationRequestModel requestModel) async {
    const String url =
        "http://3.6.170.253:1080/server.php/api/v1/player/verify";

    try {
      final response = await Dio().post(url,
          data: requestModel.toJson(),
          options: Options(
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        return VerificationResponseModel.fromJson(response.data);
      } else {
        print("Error : ${response.statusMessage}");
        print("Error:${response.data["message"] ?? "unknown message "}");
        return VerificationResponseModel(
            status: "Error", messages: response.data["message"]);
      }
    } catch (e) {
      print("Exception:$e");
      return null;
    }
  }
}

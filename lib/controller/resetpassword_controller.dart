import 'package:dio/dio.dart';

import '../model/resetpassword_request_model.dart';
import '../model/resetpassword_response_model.dart';

class ResetPasswordController {
  final Dio _dio = Dio();

  Future<ResetPasswordResponseModel?> resetPassword(
      ResetPasswordRequestModel requestModel) async {
    const String url =
        "http://3.6.170.253:1080/server.php/api/v1/reset-password";
    print(url);

    try {
      Response response = await _dio.post(
        url,
        data: requestModel.toJson(),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      print("url$url");
      if (response.statusCode == 200) {
        print(response);
        print("00000000000000000000123");
        return ResetPasswordResponseModel.fromJson(response.data);
      } else {
        print("else part ");
        return null;
      }
    } catch (e) {
      print("Error in resetPassword: $e");
      return null;
    }
  }
}

// signup_controller.dart
import 'package:dio/dio.dart';

import '../model/signup_request_model.dart';
import '../model/signup_response_model.dart';

class SignupController {
  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    try {
      final response = await Dio().post(
        'http://3.6.170.253:1080/server.php/api/v1/player/signup',
        data: requestModel.toJson(),
      );

      return SignupResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return SignupResponseModel.fromJson(e.response?.data ?? {});
      } else {
        throw Exception("API Error: ${e.message}");
      }
    }
  }
}

import 'package:dio/dio.dart';
import 'package:pokerpad/model/player_signup_response_model.dart';

import '../model/player_signup_request_model.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<PlayerSignupResponseModel?> signupPlayer(
      PlayerSignupRequestModel requestModel) async {
    const String url =
        "http://3.6.170.253:1080/server.php/api/v1/player/signup";
    try {
      final response = await _dio.post(url,
          data: requestModel.toJson(),
          options: Options(headers: {"Content-Type": "application/json"}));
      if (response.statusCode == 200) {
        return PlayerSignupResponseModel.fromJson(response.data);
      } else {
        print("Error:${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("API Error: $e");
      return null;
    }
  }
}

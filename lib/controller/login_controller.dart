import 'package:dio/dio.dart';
import 'package:pokerpad/model/login_request_model.dart';
import 'package:pokerpad/model/login_response_model.dart';

class LoginController {
  Future<LoginResponseModel?> login(LoginRequestModel requestModel) async {
    const String url = "http://3.6.170.253:1080/server.php/api/v1/player/login";
    try {
      final response = await Dio().post(url, data: requestModel.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        print("okkkkkk");
        return LoginResponseModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}

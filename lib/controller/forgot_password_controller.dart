import 'package:dio/dio.dart';
import 'package:pokerpad/model/forgot_password_model.dart';

class ForgotPasswordController {
  final String baseUrl =
      "http://3.6.170.253:1080/server.php/api/v1/forgot-password";

  Future<ForgotPasswordRequestModel?> forgotPassword(
      ForgotPasswordRequestModel request) async {
    print(baseUrl);
    try {
      final response = await Dio().post(
        baseUrl,
        data: request.toJson(),
        options: Options(
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200) {
        return ForgotPasswordRequestModel.fromJson(response.data);
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}

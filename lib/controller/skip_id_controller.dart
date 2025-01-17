import 'package:dio/dio.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/skip_id_request_model.dart';
import 'package:pokerpad/model/skip_id_response_model.dart';

class SkipIdController {
  final String baseUrl =
      "http://3.6.170.253:1080/server.php/api/v1/player/skip-id/";

  Future<SkipIdResponseModel?> skipButton(
      SkipIdRequestModel requestModel) async {
    String url =
        "$baseUrl${SignupController.userId}?XDEBUG_SESSION_START=netbeans-xdebug";
    print(url);
    try {
      final response = await Dio().post(
        url,
        data: requestModel.toJson(),
        options: Options(
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200) {
        return SkipIdResponseModel.fromJson(response.data);
      } else {
        // Handle errors
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}

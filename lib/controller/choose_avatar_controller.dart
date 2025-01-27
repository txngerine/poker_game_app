import 'package:dio/dio.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/choose_avatar_request_model.dart';
import 'package:pokerpad/model/choose_avatar_response_model.dart';

class ChooseAvatarController {
  final String baseUrl =
      "http://3.6.170.253:1080/server.php/api/v1/avatar-choose/";

  Future<ChooseAvatarResponseModel?> chooseAvatar(
      ChooseAvatarRequestModel requestModel) async {
    String url =
        "$baseUrl${SignupController.userId}?XDEBUG_SESSION_START=netbeans-xdebug";
    print("Request URL: $url");

    try {
      final response = await Dio().post(
        url,
        data: requestModel.toJson(),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print("Avatar chosen successfully.");
        return ChooseAvatarResponseModel.fromJson(response.data);
      } else {
        print("Error: Status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}

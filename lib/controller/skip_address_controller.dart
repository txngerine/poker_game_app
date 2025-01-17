import 'package:dio/dio.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/skip_address_request_model.dart';
import 'package:pokerpad/model/skip_address_response_model.dart';

class SkipAddressController {
  final String baseUrl =
      "http://3.6.170.253:1080/server.php/api/v1/player/skip-address/";
  Future<SkipAddressResponseModel?> skipButton(
      SkipAddressRequestModel requestModel) async {
    String url =
        "$baseUrl${SignupController.userId}?XDEBUG_SESSION_START=netbeans-xdebug";
    try {
      final response = await Dio().post(
        url,
        data: requestModel.toJson(),
        options: Options(
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        return SkipAddressResponseModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error:$e");
      return null;
    }
  }
}

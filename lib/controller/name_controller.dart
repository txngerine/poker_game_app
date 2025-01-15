import 'package:dio/dio.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/name_request_model.dart';
import 'package:pokerpad/model/name_response_model.dart';

class NameController {
  final String baseUrl = "http://3.6.170.253:1080/server.php/api/v1/players/";

  Future<NameResponseModel?> getName(NameRequestModel requestModel) async {
    String url =
        "$baseUrl${SignupController.userId}?XDEBUG_SESSION_START=netbeans-xdebug";

    try {
      final response = await Dio().put(url,
          data: requestModel.toJson(),
          options: Options(
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        print("API Call Successful");
        return NameResponseModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusMessage}");
        return NameResponseModel(status: "error");
      }
    } catch (e) {
      print("Error:$e");
      return NameResponseModel(status: "API CONTROLLER ERROR", data: null);
    }
  }
}

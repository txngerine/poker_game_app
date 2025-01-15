import 'package:dio/dio.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/dob_request_model.dart';
import 'package:pokerpad/model/dob_response_model.dart';

class DobController {
  // Base URL
  final String baseurl = "http://3.6.170.253:1080/server.php/api/v1/players/";

  Future<DobResponseModel?> getDob(DobRequestModel requestModel) async {
    // Dynamically generate the URL using the userId from SignupController
    String url =
        "$baseurl${SignupController.userId}?XDEBUG_SESSION_START=netbeans-xdebug";

    try {
      print("Request URL: $url"); // Debugging: check the final URL

      final response = await Dio().put(
        url,
        data: requestModel.toJson(),
        options: Options(
          validateStatus: (status) => true, // Allow all status codes
        ),
      );

      // Debugging: print response status and data
      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      // Handle the response
      if (response.statusCode == 200) {
        print("API Call Successful");
        return DobResponseModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusMessage}");
        return DobResponseModel(status: "Error..", data: null);
      }
    } catch (e) {
      // Catch and log errors
      print("Error: $e");
      return DobResponseModel(status: "API CONTROLLER ERROR", data: null);
    }
  }
}

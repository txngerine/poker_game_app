import 'package:dio/dio.dart';

import '../model/players_gender_request_model.dart';
import '../model/players_gender_response_model.dart';

class GenderController {
  final String baseUrl = "http://3.6.170.253:1080/server.php/api/v1/players";

  Future<PlayersGenderResponseModel?> gender(
      PlayersGenderRequestModel requestModel) async {
    String url =
        "$baseUrl/${requestModel.id}?XDEBUG_SESSION_START=netbeans-xdebug";

    try {
      final response = await Dio().put(
        url,
        data: requestModel.toJson(),
        options: Options(
          validateStatus: (status) =>
              status! < 500, // Allows status code checks
        ),
      );

      // Check if response is successful
      if (response.statusCode == 200) {
        return PlayersGenderResponseModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusCode}");
        return PlayersGenderResponseModel(
          status: "Error",
          message: response.data["message"] ?? "Unknown error",
        );
      }
    } catch (e) {
      print("Exception: $e");
      return PlayersGenderResponseModel(
        status: "Error",
        message: "An unexpected error occurred. Please try again later.",
      );
    }
  }
}

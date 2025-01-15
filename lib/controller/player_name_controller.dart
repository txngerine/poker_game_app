import 'package:dio/dio.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/player_name_response_model.dart';

class PlayerNameController {
  final String baseUrl = "http://3.6.170.253:1080/server.php/api/v1/player/";

  Future<PlayerNameResponseModel?> fetchPlayerDetails() async {
    String url =
        "$baseUrl${SignupController.userId}?XDEBUG_SESSION_START=netbeans-xdebug";
    print(url);

    try {
      final response = await Dio().get(
        url,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("Data fetched successfully");
        return PlayerNameResponseModel.fromJson(response.data);
      } else {
        print('Error: Status code ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      print(
          'DioError: ${e.response?.statusCode} - ${e.response?.statusMessage}');
      return null;
    } catch (e) {
      print('Error fetching player data: $e');
      return null;
    }
  }
}

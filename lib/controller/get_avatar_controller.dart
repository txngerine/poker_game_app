import 'package:dio/dio.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/get_avatar_response_model.dart';

class GetAvatarController {
  final String baseUrl =
      "http://3.6.170.253:1080/server.php/api/v1/avatar-list/";

  Future<GetAvatarResponseModel?> getAvatar() async {
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
        print("Avatar fetched successfully");
        print(response.data);
        return GetAvatarResponseModel.fromJson(response.data);
      } else {
        print('Error: Status code ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      print(
          'DioError: ${e.response?.statusCode} - ${e.response?.statusMessage}');
      return null;
    } catch (e) {
      print('Error fetching Avatar data: $e');
      return null;
    }
  }
}

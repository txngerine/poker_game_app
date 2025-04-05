import 'package:dio/dio.dart';
import 'package:pokerpad/model/rat_hole_request_model.dart';
import 'package:pokerpad/model/rat_hole_response_model.dart';

class RatHoleController {
  final String url =
      "http://3.6.170.253:1080/server.php/api/v1/norathole-check";
  Future<RatHoleResponseModel?> checkRatHole(
      RatHoleRequestModel requestModel) async {
    try {
      final response = await Dio().post(url,
          data: requestModel.toJson(),
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        print("Rat Hole api successfully");
        return RatHoleResponseModel.fromJson(response.data);
      } else {
        print("Rat Hole api error");
        return RatHoleResponseModel.fromJson(response.data);
      }
    } catch (e) {
      print("error form api:$e");
      return null;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:pokerpad/model/terms_request_model.dart';
import 'package:pokerpad/model/terms_response_model.dart';

class TermsController {
  final String baseUrl = "http://3.6.170.253:1080/server.php/api/v1/players/";

  Future<TermsResponseModel?> terms(TermsRequestModel requestModel) async {
    String url =
        "$baseUrl${requestModel.id}?XDEBUG_SESSION_START=netbeans-xdebug";
    print(url);

    try {
      final response = await Dio().put(url,
          data: requestModel.toJson(),
          options: Options(
            validateStatus: (status) => true,
          ));
      //check response

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return TermsResponseModel.fromJson(response.data);
      } else {
        print("Error..${response.statusMessage}");
        return TermsResponseModel(
            status: "Error:${response.statusMessage}", data: null);
      }
    } catch (e) {
      print("Error:$e");
      return TermsResponseModel(status: "Error..}", data: null);
    }
  }
}

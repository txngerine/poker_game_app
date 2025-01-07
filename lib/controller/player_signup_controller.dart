import '../model/player_signup_request_model.dart';
import '../model/player_signup_response_model.dart';
import '../services/api_service.dart';

class PlayerSignupController {
  final ApiService _apiService = ApiService();

  Future<PlayerSignupResponseModel?> signupPlayer(
      String email, String password, int deviceId, String accountNo) async {
    PlayerSignupRequestModel requestModel = PlayerSignupRequestModel(
      email: email,
      password: password,
      deviceId: deviceId,
      accountNo: accountNo,
    );

    return await _apiService.signupPlayer(requestModel);
  }
}

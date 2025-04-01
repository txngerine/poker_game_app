// import 'package:dio/dio.dart';
// import 'package:pokerpad/model/player_signup_response_model.dart';
//
// import '../model/player_signup_request_model.dart';
//
// class ApiService {
//   final Dio _dio = Dio();
//   Future<PlayerSignupResponseModel?> signupPlayer(
//       PlayerSignupRequestModel requestModel) async {
//     const String url =
//         "http://3.6.170.253:1080/server.php/api/v1/player/signup";
//     try {
//       final response = await _dio.post(url,
//           data: requestModel.toJson(),
//           options: Options(headers: {"Content-Type": "application/json"}));
//       if (response.statusCode == 200) {
//         return PlayerSignupResponseModel.fromJson(response.data);
//       } else {
//         print("Error:${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//       print("API Error: $e");
//       return null;
//     }
//   }
// }
//
// import 'package:dio/dio.dart';

// import '../model/player_signup_request_model.dart';
// import '../model/player_signup_response_model.dart';

// class ApiService {
//   final Dio _dio = Dio();

//   Future<PlayerSignupResponseModel?> signupPlayer(
//       PlayerSignupRequestModel requestModel) async {
//     const String url =
//         "http://3.6.170.253:1080/server.php/api/v1/player/signup";
//     try {
//       print('Request Payload: ${requestModel.toJson()}');
//       final response = await _dio.post(
//         url,
//         data: requestModel.toJson(),
//         options: Options(headers: {
//           "Content-Type": "application/json",
//         }),
//       );
//       print(requestModel.toJson());
//       if (response.statusCode == 200) {
//         return PlayerSignupResponseModel.fromJson(response.data);
//       } else {
//         print('Error Response: ${response.data}');
//         return null;
//       }
//     } catch (e) {
//       print("API Error: $e");
//       return null;
//     }
//   }
// }



import 'package:dio/dio.dart';

import '../model/leaderboard_monthly_model.dart';
import '../model/leaderboard_yearly_model.dart';
import '../model/player_signup_request_model.dart';
import '../model/player_signup_response_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://3.6.170.253:1080/server.php/api/v1/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.path}');
          print('Headers: ${options.headers}');
          print('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Error: ${_handleError(e)}');
          return handler.next(e);
        },
      ),
    );
  }

  // Error handling method
  String _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection Timeout';
        case DioExceptionType.sendTimeout:
          return 'Send Timeout';
        case DioExceptionType.receiveTimeout:
          return 'Receive Timeout';
        case DioExceptionType.cancel:
          return 'Request Cancelled';
        case DioExceptionType.unknown:
        default:
          return 'Unexpected Error';
      }
    } else {
      return 'Unknown Error: $error';
    }
  }

  // Signup Player API
  Future<PlayerSignupResponseModel?> signupPlayer(
      PlayerSignupRequestModel requestModel) async {
    const String endpoint = "player/signup";
    try {
      final response = await _dio.post(
        endpoint,
        data: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        return PlayerSignupResponseModel.fromJson(response.data);
      } else {
        print('Error Response: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print("API Error: ${_handleError(e)}");
      return null;
    }
  }

  // Generic method to fetch leaderboard data
  Future<T?> _fetchLeaderboard<T>(String endpoint, T Function(dynamic) fromJson) async {
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('API Error: ${_handleError(e)}');
      return null;
    }
  }

  // Fetch Monthly Leaderboard
  Future<LeaderboardMonthly?> fetchLeaderboard() =>
      _fetchLeaderboard('monthly-report/1', (data) => LeaderboardMonthly.fromJson(data));

  // Fetch Yearly Leaderboard
  Future<LeaderboardYearly?> fetchLeaderboardYear() =>
      _fetchLeaderboard('yearly-report/1', (data) => LeaderboardYearly.fromJson(data));
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fl_chart/fl_chart.dart';
// import '../model/graphmodel.dart';

// class ChartController with ChangeNotifier {
//   List<FlSpot> data = [];
//   bool isLoading = true;
//   Player? player;
//   String activeSince = "N/A";
//   String totalWinnings = "\$0";
//   String wonPerHour = "0";
//   String avatar = '';
//   String username = "PLAYER";

//   final String apiUrl =
//       'http://3.6.170.253:1080/server.php/api/v1/graph-report/1?XDEBUG_SESSION_START=netbeans-xdebug';

//   /// Fetch Data from API
//   Future<void> fetchGraphData() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final graphModel = graphModelFromJson(response.body);
//         _setPlayerData(graphModel);
//         _setGraphData(graphModel);
//         isLoading = false;
//       } else {
//         _setDefaultData();
//       }
//     } catch (e) {
//       debugPrint("Error fetching data: $e");
//       _setDefaultData();
//     }
//     notifyListeners();
//   }

//   /// Set Player Data
//   void _setPlayerData(GraphModel graphModel) {
//     player = graphModel.data?.player;

//     avatar = player?.photo ?? '';
//     username = player?.nickname ?? "PLAYER";

//     activeSince = player?.regDate != null
//         ? "${player!.regDate!.month}/${player!.regDate!.year}"
//         : "N/A";

//     totalWinnings = "\$${player?.winnings ?? '0'}";
//     wonPerHour = player?.handsPlayed != null && player!.handsPlayed! > 0
//         ? (double.parse(player!.winnings ?? '0') / player!.handsPlayed!)
//             .toStringAsFixed(2)
//         : "0";
//   }

//   /// Set Graph Data
//   void _setGraphData(GraphModel graphModel) {
//     data = graphModel.data?.history?.asMap().entries.map((entry) {
//           int index = entry.key;
//           var history = entry.value;
//           double yValue = double.tryParse(history.win ?? '0.0') ?? 0.0;
//           return FlSpot(index.toDouble() * 10000, yValue);
//         }).toList() ??
//         [const FlSpot(0, 0)];
//   }

//   /// Set Default Data in Case of Failure
//   void _setDefaultData() {
//     data = [const FlSpot(0, 0)];
//     isLoading = false;
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import '../model/graphmodel.dart';

class ChartController with ChangeNotifier {
  List<FlSpot> data = [];
  bool isLoading = true;
  Player? player;
  String activeSince = "N/A";
  String totalHandsPlayed = '';
  String totalWinnings = "\$0";
  String wonPerHour = "0";
  String avatar = '';
  String username = "PLAYER";
  String countryFlag = ''; // New field for country flag

  final String apiUrl =
      'http://3.6.170.253:1080/server.php/api/v1/graph-report/1?XDEBUG_SESSION_START=netbeans-xdebug';

  /// Fetch Data from API with retry logic
  Future<void> fetchGraphData({int retries = 3}) async {
    int attempt = 0;
    while (attempt < retries) {
      try {
        final response = await http.get(Uri.parse(apiUrl)).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw Exception("Request timed out");
          },
        );

        if (response.statusCode == 200) {
          final graphModel = graphModelFromJson(response.body);
          if (graphModel.data != null) {
            _setPlayerData(graphModel);
            _setGraphData(graphModel);
            isLoading = false;
          } else {
            _setDefaultData();
          }
          notifyListeners();
          return;
        } else {
          throw Exception("Invalid response: ${response.statusCode}");
        }
      } catch (e) {
        debugPrint("Error fetching data: $e");
        attempt++;
        if (attempt >= retries) {
          _setDefaultData();
        }
        await Future.delayed(Duration(milliseconds: 500 * attempt)); // Exponential backoff
      }
    }
  }

  /// Set Player Data
  void _setPlayerData(GraphModel graphModel) {
    player = graphModel.data?.player;

    avatar = player?.photo?.isNotEmpty == true ? player!.photo! : '';
    username = player?.nickname ?? "PLAYER";

    activeSince = player?.regDate != null
        ? "${player!.regDate!.month}/${player!.regDate!.year}"
        : "N/A";

    totalWinnings = "\$${player?.winnings ?? '0'}";

    // Calculate winnings per hand safely
    final double winnings = double.tryParse(player?.winnings ?? '0') ?? 0.0;
    final int handsPlayed = player?.handsPlayed ?? 0;
    wonPerHour = handsPlayed > 0
        ? (winnings / handsPlayed).toStringAsFixed(2)
        : "0";

    // Set country flag
    countryFlag = player?.countryFlag ?? '';
  }

  /// Set Graph Data
  void _setGraphData(GraphModel graphModel) {
    final historyList = graphModel.data?.history ?? [];
    if (historyList.isNotEmpty) {
      data = historyList.asMap().entries.map((entry) {
        int index = entry.key;
        var history = entry.value;
        double yValue = double.tryParse(history.win ?? '0.0') ?? 0.0;

        // Prevent large x-values by keeping indices normalized
        return FlSpot(index.toDouble(), yValue);
      }).toList();
    } else {
      data = [const FlSpot(0, 0)];
    }
  }

  /// Set Default Data in Case of Failure
  void _setDefaultData() {
    data = [const FlSpot(0, 0)];
    isLoading = false;
    avatar = '';
    totalHandsPlayed = '';
    username = "PLAYER";
    activeSince = "N/A";
    totalWinnings = "\$0";
    wonPerHour = "0";
    countryFlag = ''; // Reset flag on failure
    notifyListeners();
  }
}

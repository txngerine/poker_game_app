import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import '../model/graphmodel.dart';

class ChartController with ChangeNotifier {
  List<FlSpot> data = [];
  bool isLoading = true;
  Player? player;
  String activeSince = "N/A";
  String totalWinnings = "\$0";
  String wonPerHour = "0";
  String avatar = '';
  String username = "PLAYER";

  final String apiUrl =
      'http://3.6.170.253:1080/server.php/api/v1/graph-report/1?XDEBUG_SESSION_START=netbeans-xdebug';

  /// Fetch Data from API
  Future<void> fetchGraphData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final graphModel = graphModelFromJson(response.body);
        _setPlayerData(graphModel);
        _setGraphData(graphModel);
        isLoading = false;
      } else {
        _setDefaultData();
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
      _setDefaultData();
    }
    notifyListeners();
  }

  /// Set Player Data
  void _setPlayerData(GraphModel graphModel) {
    player = graphModel.data?.player;

    avatar = player?.photo ?? '';
    username = player?.nickname ?? "PLAYER";

    activeSince = player?.regDate != null
        ? "${player!.regDate!.month}/${player!.regDate!.year}"
        : "N/A";

    totalWinnings = "\$${player?.winnings ?? '0'}";
    wonPerHour = player?.handsPlayed != null && player!.handsPlayed! > 0
        ? (double.parse(player!.winnings ?? '0') / player!.handsPlayed!)
            .toStringAsFixed(2)
        : "0";
  }

  /// Set Graph Data
  void _setGraphData(GraphModel graphModel) {
    data = graphModel.data?.history?.asMap().entries.map((entry) {
          int index = entry.key;
          var history = entry.value;
          double yValue = double.tryParse(history.win ?? '0.0') ?? 0.0;
          return FlSpot(index.toDouble() * 10000, yValue);
        }).toList() ??
        [const FlSpot(0, 0)];
  }

  /// Set Default Data in Case of Failure
  void _setDefaultData() {
    data = [const FlSpot(0, 0)];
    isLoading = false;
  }
}

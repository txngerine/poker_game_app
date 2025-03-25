// ignore_for_file: unused_import, prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/graphmodel.dart'; // Import your GraphModel

class ChartLineWidget extends StatefulWidget {
  const ChartLineWidget({super.key});

  @override
  State<ChartLineWidget> createState() => _ChartLineWidgetState();
}

class _ChartLineWidgetState extends State<ChartLineWidget> {
  List<FlSpot> data = [];
  bool isLoading = true;
  Player? player;
  String activeSince = "N/A";
  String totalWinnings = "\$0";
  String wonPerHour = "0";
  String avatar = '';
  String username = "PLAYER";

  @override
  void initState() {
    super.initState();
    fetchGraphData();
  }

  Future<void> fetchGraphData() async {
    final url = Uri.parse(
        'http://3.6.170.253:1080/server.php/api/v1/graph-report/1?XDEBUG_SESSION_START=netbeans-xdebug');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final graphModel = graphModelFromJson(response.body);
        setState(() {
          // Fetch Player data
          player = graphModel.data?.player;

          // Set avatar and username
          avatar = player?.photo ?? '';
          username = player?.nickname ?? "PLAYER";

          // Set activeSince from reg_date
          activeSince = player?.regDate != null
              ? "${player!.regDate!.month}/${player!.regDate!.year}"
              : "N/A";

          // Set total winnings and won/hour
          totalWinnings = "\$${player?.winnings ?? '0'}";
          wonPerHour = player?.handsPlayed != null && player!.handsPlayed! > 0
              ? (double.parse(player!.winnings ?? '0') / player!.handsPlayed!)
                  .toStringAsFixed(2)
              : "0";

          // Generate graph data from history
          data = graphModel.data?.history?.asMap().entries.map((entry) {
                int index = entry.key;
                var history = entry.value;
                double yValue = double.tryParse(history.win ?? '0.0') ?? 0.0;
                return FlSpot(index.toDouble() * 10000, yValue);
              }).toList() ??
              [const FlSpot(0, 0)];

          isLoading = false;
        });
      } else {
        setState(() {
          data = [const FlSpot(0, 0)];
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        data = [const FlSpot(0, 0)];
        isLoading = false;
      });
      debugPrint("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        width: width * 0.64,
        height: height * 0.72,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAvatarWithUsername(width, height),
                  _buildGraphSection(width, height),
                  _buildBottomStats(width),
                ],
              ),
      ),
    );
  }

  /// Avatar and Username Section
   Widget _buildAvatarWithUsername(double width, double height) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width * 0.52,
            height: height / 3.2,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: avatar.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(avatar),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/default_avatar.png'),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        /// Username in Top-Left
        Positioned(
          top: 20,
          left: 18,
          child: Row(
            children: [
              Text(
                username.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        /// Flag Overlay in Top-Right
      ],
    );
  }
  /// Graph Section
  Widget _buildGraphSection(double width, double height) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 195, 76),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(4, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row with Title and Date
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "WINNINGS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "ACTIVE SINCE $activeSince",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          /// Graph Container
          Container(
            height: height / 5,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, _) {
                        return Text(
                          '\$${(value / 1000).toStringAsFixed(0)}K',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        return Text(
                          '${(value / 1000).toStringAsFixed(0)}K',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: data,
                    isCurved: true,
                    color: Colors.black,
                    barWidth: 2,
                    isStrokeCapRound: false,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),

          /// Bottom Label - "HANDS PLAYED"
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "HANDS PLAYED",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Bottom Stats Section
  Widget _buildBottomStats(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem("WON/HOUR", "\$$wonPerHour", width / 3),
              _buildStatItem("WINNINGS", totalWinnings, width / 3),
            ],
          ),
        ],
      ),
    );
  }

  /// Individual Stat Item
  Widget _buildStatItem(String label, String value, double width) {
    return Container(
      width: width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 195, 76),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber, width: 1.2),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

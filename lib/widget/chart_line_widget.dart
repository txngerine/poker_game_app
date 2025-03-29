// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controller/chartline_controller.dart';

class ChartLineWidget extends StatefulWidget {
  const ChartLineWidget({super.key});

  @override
  State<ChartLineWidget> createState() => _ChartLineWidgetState();
}

class _ChartLineWidgetState extends State<ChartLineWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ChartController>(context, listen: false).fetchGraphData());
  }

  @override
  Widget build(BuildContext context) {
    final chartController = Provider.of<ChartController>(context);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF3E3E3E), // Darker shade at top
              Color(0xFF1C1C1C), // Dark shade at bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: width * 0.54,
        height: height * 0.66,
        child: chartController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAvatarWithUsername(chartController, width, height),
                  _buildGraphSection(chartController, width, height),
                  _buildBottomStats(chartController, width),
                ],
              ),
      ),
    );
  }

  /// Avatar and Username Section
  Widget _buildAvatarWithUsername(
      ChartController chartController, double width, double height) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width * 0.50,
            height: height / 2.9,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12),bottom: Radius.circular(12)),border: Border.all(color: Colors.black, width: 1.5),
              image: chartController.avatar.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(chartController.avatar),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/default_avatar.png'),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 18,
          child: Text(
            chartController.username.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 251,
          child: Container(decoration: BoxDecoration(
  gradient: const LinearGradient(
            colors: [
              Color(0xFF3E3E3E), // Darker shade at top
              Color(0xFF1C1C1C), // Dark shade at bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
    shape: BoxShape.circle,
  ),
            child: CircleAvatar(radius: 18,backgroundColor: Colors.transparent,
              child: CircleAvatar(radius: 16,
                child: Image.network(chartController.countryFlag,fit: BoxFit.cover,),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Graph Section
  Widget _buildGraphSection(
    ChartController chartController, double width, double height) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: const DecorationImage(
        image: AssetImage('assets/images/avatarpopupwinninggraph.png'), // Path to your image
        fit: BoxFit.fill, // Adjust fit as needed
      ),
    ),
    child: Column(
      children: [
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
                "ACTIVE SINCE ${chartController.activeSince}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height / 7,
          child: Container(width: 230,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        return Text(
                          '\$${(value / 1000).toStringAsFixed(0)}K',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        );
                      },
                      interval: 1000, // Optional interval adjustment
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false), // Remove top values
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false), // Remove right values
                  ),
                  bottomTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: true), // Keep bottom
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(color: Colors.black, width: 1), // Keep bottom
                    right: BorderSide(color: Colors.transparent), // No right border
                    top: BorderSide(color: Colors.transparent), // No top border
                    left: BorderSide(color: Colors.black, width: 1), // Keep left
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: chartController.data,
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
        ),
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Text(
            "HANDS PLAYED",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}



  /// Bottom Stats Section
  Widget _buildBottomStats(ChartController chartController, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem("WON/HOUR", "\$${chartController.wonPerHour}", width / 3),
          _buildStatItem("WINNINGS", chartController.totalWinnings, width / 3),
        ],
      ),
    );
  }

  /// Individual Stat Item
  Widget _buildStatItem(String label, String value, double width) {
    return Container(
      width: width * 0.72,height: 40,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: const DecorationImage(
        image: AssetImage('assets/images/avatarwinpop.png'), // Path to your image
        fit: BoxFit.fill, // Adjust fit as needed
      ),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

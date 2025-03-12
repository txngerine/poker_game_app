import 'package:flutter/material.dart';

class DownloadingProgressWidget extends StatefulWidget {
  const DownloadingProgressWidget({super.key});

  @override
  State<DownloadingProgressWidget> createState() =>
      _DownloadingProgressWidgetState();
}

class _DownloadingProgressWidgetState extends State<DownloadingProgressWidget> {
  double downloadProgress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: downloadProgress,
          backgroundColor: Colors.grey[300],
          color: Colors.blue,
        ),
        const SizedBox(height: 10),
        Text(
          '${(downloadProgress * 100).toStringAsFixed(0)}%',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

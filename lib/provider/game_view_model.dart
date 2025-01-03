import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class GameViewModel extends ChangeNotifier {
  String? serverUrl;
  bool isLoading = true;

  Future<void> initialize() async {
    await _downloadAndExtractFile();
    isLoading = false;
    notifyListeners();
  }

  Future<void> _downloadAndExtractFile() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final extractionPath = '${tempDir.path}/dist/';
      final extractionDir = Directory(extractionPath);

      if (await extractionDir.exists()) {
        debugPrint('Files already extracted. Skipping download.');
        serverUrl = "file://${extractionPath}dist/index.html";
        return;
      }

      debugPrint('Downloading and extracting ZIP file...');
      const url = 'https://api-poker.indrean.com/data/poker2.zip';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final zipFilePath = '${tempDir.path}/poker.zip';
        final zipFile = File(zipFilePath);
        await zipFile.writeAsBytes(response.bodyBytes);

        final archive = ZipDecoder().decodeBytes(await zipFile.readAsBytes());
        for (final file in archive) {
          final filePath = '$extractionPath${file.name}';
          if (file.isFile) {
            final extractedFile = File(filePath)..createSync(recursive: true);
            await extractedFile.writeAsBytes(file.content as List<int>);
          }
        }

        serverUrl = "file://${extractionPath}dist/index.html";
      } else {
        throw Exception('Failed to download ZIP file: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
    }
  }
}

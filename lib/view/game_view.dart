import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../model/login_response_model.dart';

class GameView extends StatefulWidget {
  final LoginResponseModel? playerResponse;
  final int? buttonId;

  const GameView({super.key, this.playerResponse, this.buttonId});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  String? avatar;
  String? lobbyAvatar;
  String? detailAvatar;
  String? serverUrl;
  String? balance;
  bool isLoading = true;
  int? buttonId;
  int? id;

  @override
  void initState() {
    super.initState();
    print(widget.playerResponse?.data!.id);
    print("token${widget.buttonId}");
    _downloadAndExtractFile();
  }

  Future<void> _downloadAndExtractFile() async {
    avatar = widget.playerResponse?.data!.avatar;
    buttonId = widget.buttonId;
    balance = widget.playerResponse?.data!.balance;
    lobbyAvatar = widget.playerResponse?.data!.lobbyAvatar;
    detailAvatar = widget.playerResponse?.data!.detailAvatar;

    id = widget.playerResponse?.data!.id;

    try {
      final tempDir = await getTemporaryDirectory();
      final extractionPath = '${tempDir.path}/dist/';
      final extractionDir = Directory(extractionPath);

      if (await extractionDir.exists()) {
        debugPrint('Files already extracted. Skipping download.');
        setState(() {
          serverUrl =
              "file://${extractionPath}dist/index.html?buttonId=$buttonId&avatar=$avatar&lobbyAvatar=$lobbyAvatar&detailAvatar=$detailAvatar&balance=$balance&id=$id";

          // print("123${serverUrl}?gameToken${gameToken}&avatar=${avatar}&balance=${balance}");
          print("123${serverUrl}");
          isLoading = false;
        });
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

        setState(() {
          serverUrl = "file://${extractionPath}dist/index.html";
          print("321$serverUrl");
          isLoading = false;
        });
      } else {
        throw Exception('Failed to download ZIP file: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            )) // Show a loader
          : serverUrl == null
              ? const Center(
                  child: Text("Failed to load content")) // Handle failure case
              : InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri(serverUrl!)),
                  initialSettings: InAppWebViewSettings(
                    javaScriptEnabled: true,
                    allowFileAccessFromFileURLs: true,
                    allowUniversalAccessFromFileURLs: true,
                  ),
                ),
    );
  }
}

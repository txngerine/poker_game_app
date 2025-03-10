import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    print("game url:");
    print(widget.playerResponse?.data?.holdemGameUrl.toString());

    // Hide status and navigation bar for a full-screen experience
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _downloadAndExtractFile();
  }

  @override
  void dispose() {
    // Restore system UI when leaving the screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  Future<void> _downloadAndExtractFile() async {
    avatar = widget.playerResponse?.data!.avatar;
    buttonId = widget.buttonId;
    balance = widget.playerResponse?.data!.balance;
    lobbyAvatar = widget.playerResponse?.data!.lobbyAvatar;
    detailAvatar = widget.playerResponse?.data!.detailAvatar;
    id = widget.playerResponse?.data!.id;
    final url = widget.playerResponse?.data!.holdemGameUrl;
    if (url == null || url.isEmpty) {
      debugPrint('Game URL is null or empty.');
      setState(() {
        isLoading = false;
      });
      return;
    }
    try {
      final tempDir = await getTemporaryDirectory();
      final extractionPath = '${tempDir.path}/dist/';
      final extractionDir = Directory(extractionPath);

      if (await extractionDir.exists()) {
        debugPrint('Files already extracted. Skipping download.');
        setState(() {
          serverUrl =
              "file://${extractionPath}dist/index.html?buttonId=$buttonId&avatar=$avatar&lobbyAvatar=$lobbyAvatar&detailAvatar=$detailAvatar&balance=$balance&id=$id";
          isLoading = false;
        });
        return;
      }

      debugPrint('Downloading and extracting ZIP file...');
      // final url = widget.playerResponse?.data?.holdemGameUrl;
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
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        return true; // Allow the pop
      }, // Prevent back navigation
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : serverUrl == null
                  ? const Center(
                      child: Text(
                        "Failed to load content",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : InAppWebView(
                      initialUrlRequest: URLRequest(url: WebUri(serverUrl!)),
                      initialSettings: InAppWebViewSettings(
                        javaScriptEnabled: true,
                        allowFileAccessFromFileURLs: true,
                        allowUniversalAccessFromFileURLs: true,
                      ),
                      onWebViewCreated: (controller) {
                        controller.addJavaScriptHandler(
                          handlerName: "FlutterChannel",
                          callback: (args) {
                            debugPrint("Received from JS: $args");
                            if (args.isNotEmpty) {
                              var message = args[0];
                              if (message["action"] == "exit") {
                                Navigator.pop(context);
                              }
                            }
                          },
                        );
                      },
                    ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_static/shelf_static.dart';

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
  String? balance;
  String? serverUrl;
  bool isLoading = true;
  int? buttonId;
  int? id;
  HttpServer? _server;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _downloadAndExtractFile();
  }

  @override
  void dispose() {
    _stopServer();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  /// Deletes old files if needed
  Future<void> _deleteTempFiles() async {
    final tempDir = await getTemporaryDirectory();
    final extractionPath = '${tempDir.path}/dist/';
    final zipFilePath = '${tempDir.path}/poker.zip';

    try {
      final extractionDir = Directory(extractionPath);
      if (await extractionDir.exists()) {
        await extractionDir.delete(recursive: true);
        debugPrint('Extracted files deleted.');
      }

      final zipFile = File(zipFilePath);
      if (await zipFile.exists()) {
        await zipFile.delete();
        debugPrint('ZIP file deleted.');
      }
    } catch (e) {
      debugPrint('Error deleting temp files: $e');
    }
  }

  /// Checks if the extracted files already exist
  Future<bool> _isAlreadyExtracted() async {
    final tempDir = await getTemporaryDirectory();
    final extractedFile = File('${tempDir.path}/dist/index.html');
    return extractedFile.exists();
  }

  /// Checks if the ZIP file already exists
  Future<bool> _isZipFileDownloaded() async {
    final tempDir = await getTemporaryDirectory();
    final zipFile = File('${tempDir.path}/poker.zip');
    return zipFile.exists();
  }

  /// Downloads and extracts the ZIP file to a temporary directory
  Future<void> _downloadAndExtractFile() async {
    final isExtracted = await _isAlreadyExtracted();
    final isZipDownloaded = await _isZipFileDownloaded();

    if (isExtracted) {
      debugPrint('Files already extracted. Skipping download.');
      await _startServer(await _getExtractionPath());
      return;
    }

    if (!isZipDownloaded) {
      await _deleteTempFiles();
    }

    avatar = widget.playerResponse?.data?.avatar;
    buttonId = widget.buttonId;
    balance = widget.playerResponse?.data?.balance;
    lobbyAvatar = widget.playerResponse?.data?.lobbyAvatar;
    detailAvatar = widget.playerResponse?.data?.detailAvatar;
    id = widget.playerResponse?.data?.id;

    final url = widget.playerResponse?.data?.holdemGameUrl;
    if (url == null || url.isEmpty) {
      _showError('Game URL is null or empty.');
      return;
    }

    try {
      final tempDir = await getTemporaryDirectory();
      final zipFilePath = '${tempDir.path}/poker.zip';
      final zipFile = File(zipFilePath);

      if (!isZipDownloaded) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          await zipFile.writeAsBytes(response.bodyBytes);
          debugPrint('ZIP file downloaded successfully.');
        } else {
          throw Exception('Failed to download ZIP file: ${response.statusCode}');
        }
      }

      await _extractZip(zipFilePath, '${tempDir.path}/dist/');
      await _startServer(await _getExtractionPath());
    } catch (e) {
      _showError('Error occurred: $e');
    }
  }

  /// Extracts ZIP content
  Future<void> _extractZip(String zipPath, String extractionPath) async {
    final bytes = await File(zipPath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    for (final file in archive) {
      final filePath = '$extractionPath${file.name}';
      if (file.isFile) {
        final extractedFile = File(filePath)..createSync(recursive: true);
        await extractedFile.writeAsBytes(file.content as List<int>);
      } else {
        Directory(filePath).createSync(recursive: true);
      }
    }
    debugPrint('Files extracted to $extractionPath');
  }

  /// Starts a local server to serve extracted files
  Future<void> _startServer(String path) async {
    final handler = createStaticHandler(
      path,
      defaultDocument: 'index.html',
    );

    try {
      final ipAddress = await _getLocalIpAddress();
      _server = await shelf_io.serve(handler, InternetAddress.anyIPv4, 4040);

      // Allow WebSocket upgrades and CORS requests
      _server?.defaultResponseHeaders
          .add('Access-Control-Allow-Origin', '*');
      _server?.defaultResponseHeaders
          .add('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
      _server?.defaultResponseHeaders
          .add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
      _server?.defaultResponseHeaders.add('Connection', 'Upgrade');
      _server?.defaultResponseHeaders.add('Upgrade', 'websocket');

      setState(() {
        serverUrl =
            "http://$ipAddress:4040/dist/index.html?buttonId=$buttonId&avatar=$avatar&lobbyAvatar=$lobbyAvatar&detailAvatar=$detailAvatar&balance=$balance&id=$id";
        isLoading = false;
      });

      debugPrint('Server running at $serverUrl');
    } catch (e) {
      _showError('Failed to start local server: $e');
    }
  }

  /// Stops the server when the widget is disposed
  Future<void> _stopServer() async {
    if (_server != null) {
      await _server?.close(force: true);
      debugPrint('Server stopped.');
    }
  }

  /// Displays error message and stops loading
  void _showError(String message) {
    debugPrint(message);
    setState(() {
      isLoading = false;
    });
  }

  /// Gets the local IP address
  Future<String> _getLocalIpAddress() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
          return addr.address;
        }
      }
    }
    return '127.0.0.1';
  }

  /// Gets extraction path
  Future<String> _getExtractionPath() async {
    final tempDir = await getTemporaryDirectory();
    return '${tempDir.path}/dist/';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        return true;
      },
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
                      onLoadError: (controller, url, code, message) {
                        _showError('Failed to load the game: $message');
                      },
                      onWebViewCreated: (controller) {
                        controller.addJavaScriptHandler(
                          handlerName: "FlutterChannel",
                          callback: (args) {
                            if (args.isNotEmpty) {
                              var message = args[0];
                              if (message["action"] == "exit") {
                                Navigator.pop(context);
                              } else if (message["action"] == "log") {
                                debugPrint("JS Console: ${message["message"]}");
                              }
                            }
                          },
                        );

                        // Inject JavaScript to enable console logging
                        controller.evaluateJavascript(source: '''
                          (function() {
                            console.log = (function(oldLog) {
                              return function(message) {
                                oldLog(message);
                                window.flutter_inappwebview.callHandler('FlutterChannel', { "action": "log", "message": message });
                              };
                            })(console.log);
                          })();
                        ''');
                      },
                    ),
        ),
      ),
    );
  }
}

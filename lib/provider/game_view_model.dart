// import 'dart:io';
//
// import 'package:archive/archive.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
//
// class GameViewModel extends ChangeNotifier {
//   String? serverUrl;
//   bool isLoading = true;
//   String? balance;
//   String? avatar;
//   int? id;
//
//   Future<void> initialize() async {
//     await _downloadAndExtractFile();
//     isLoading = false;
//     notifyListeners();
//   }
//
//   // Future<void> fetchDetails() async {
//   //   PlayerDetailsController playerNameController = PlayerDetailsController();
//   //   final response = await playerNameController.fetchPlayerDetails();
//   //   if (response?.status == "OK") {
//   //     print("okkkkkkkkkkkkkkkkkkkkkkkkkkkk");
//   //     print(response?.data?.id);
//   //     print(response?.data?.avatar);
//   //     print(response?.data?.balance);
//   //     balance = response?.data?.balance;
//   //     avatar = response?.data?.avatar;
//   //     id = response?.data?.id;
//   //   } else {
//   //     print("nooooooooooooooooooooooooooooooooo");
//   //     print(response?.status);
//   //   }
//   // }
//
//   Future<void> _downloadAndExtractFile() async {
//     try {
//       final tempDir = await getTemporaryDirectory();
//       final extractionPath = '${tempDir.path}/dist/';
//       final extractionDir = Directory(extractionPath);
//
//       if (await extractionDir.exists()) {
//         debugPrint('Files already extracted. Skipping download.');
//         serverUrl =
//             "file://${extractionPath}dist/index.html?balance=${balance}&avatar=${avatar}&id=${id}";
//         print(serverUrl);
//         print("123456789");
//         return;
//       }
//
//       debugPrint('Downloading and extracting ZIP file...');
//       const url = 'https://api-poker.indrean.com/data/poker2.zip';
//       final response = await http.get(Uri.parse(url));
//
//       if (response.statusCode == 200) {
//         final zipFilePath = '${tempDir.path}/poker.zip';
//         final zipFile = File(zipFilePath);
//         await zipFile.writeAsBytes(response.bodyBytes);
//
//         final archive = ZipDecoder().decodeBytes(await zipFile.readAsBytes());
//         for (final file in archive) {
//           final filePath = '$extractionPath${file.name}';
//           if (file.isFile) {
//             final extractedFile = File(filePath)..createSync(recursive: true);
//             await extractedFile.writeAsBytes(file.content as List<int>);
//           }
//         }
//
//         serverUrl = "file://${extractionPath}dist/index.html";
//         print(serverUrl);
//         print("987654321");
//       } else {
//         throw Exception('Failed to download ZIP file: ${response.statusCode}');
//       }
//     } catch (e) {
//       debugPrint('Error occurred: $e');
//     }
//   }
// }

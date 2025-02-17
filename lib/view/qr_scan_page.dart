import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final MobileScannerController controller = MobileScannerController();
  bool isScanned = false;
  String scannedRawValue = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onContinue() {
    // Action when the continue button is pressed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: MobileScanner(
                controller: controller,
                onDetect: (capture) {
                  if (!isScanned) {
                    setState(() {
                      isScanned = true; // Mark as scanned
                    });
                    final List<Barcode> barcodes = capture.barcodes;
                    if (barcodes.isNotEmpty) {
                      final barcode = barcodes.first;
                      if (mounted) {
                        setState(() {
                          scannedRawValue = barcode.rawValue ?? '';
                        });
                        // Process the scanned barcode if needed
                        print("Scanned: ${barcode.rawValue}");
                      }
                    }
                  }
                },
              ),
            ),
          ),
          if (isScanned) // Show continue button after scanning
            Positioned(
              bottom: 50,
              left: 50,
              right: 50,
              child: ElevatedButton(
                  onPressed: onContinue,
                  child: BuildSubHeadingText(
                    text: "continue",
                    color: Colors.black,
                  )),
            ),
          if (isScanned) // Display the scanned raw value
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white.withOpacity(0.7),
                  child: BuildSubHeadingText(
                    text: "Scanned QR Code:$scannedRawValue",
                    color: Colors.black,
                    fontSize: 10,
                  )
                  // Text(
                  //   'Scanned QR Code: $scannedRawValue',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ),
                  ),
            ),
        ],
      ),
    );
  }
}

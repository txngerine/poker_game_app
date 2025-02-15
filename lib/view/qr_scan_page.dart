import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final MobileScannerController controller = MobileScannerController();
  bool isScanned = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: MobileScanner(
            controller: controller,
            onDetect: (capture) {
              if (!isScanned) {
                isScanned = true;
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  final barcode = barcodes.first;
                  if (mounted) {
                    // Check if the widget is still mounted
                    Navigator.pop(context, barcode.rawValue);
                  }
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

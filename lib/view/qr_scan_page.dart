import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../provider/qr_provider.dart';

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
    final qrProvider = Provider.of<QrProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 350,
              width: 350,
              child: MobileScanner(
                controller: controller,
                onDetect: (capture) {
                  if (!isScanned) {
                    setState(() {
                      isScanned = true;
                    });
                    final barcode = capture.barcodes.first;
                    if (barcode.rawValue != null) {
                      // Update the QR code value in the provider
                      qrProvider.setScannedCode(barcode.rawValue!);
                      // Navigate back after updating the provider
                      Navigator.pop(context);
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

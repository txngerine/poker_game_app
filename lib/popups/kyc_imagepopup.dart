import 'package:flutter/material.dart';

class KYCImagePopup extends StatelessWidget {
  final VoidCallback onRetake;
  final VoidCallback onSubmit;
  final Image faceImage;

  const KYCImagePopup({
    super.key,
    required this.onRetake,
    required this.onSubmit,
    required this.faceImage,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Face Check',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: faceImage,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onRetake,
                  child: const Text('Retake'),
                ),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
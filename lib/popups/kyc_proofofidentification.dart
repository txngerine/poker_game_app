import 'package:flutter/material.dart';

class ProofOfIdentificationPopup extends StatelessWidget {
  const ProofOfIdentificationPopup({super.key});

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
              'Proof of Identification',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Please upload a valid proof of identification to proceed.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle file upload
              },
              child: const Text('Upload Document'),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}

// To show the popup, use the following code:
// showDialog(
//   context: context,
//   builder: (BuildContext context) => ProofOfIdentificationPopup(),
// );
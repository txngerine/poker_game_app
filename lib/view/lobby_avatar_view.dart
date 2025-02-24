import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LobbyAvatarView extends StatefulWidget {
  const LobbyAvatarView({
    super.key,
  });

  @override
  State<LobbyAvatarView> createState() => _LobbyAvatarViewState();
}

class _LobbyAvatarViewState extends State<LobbyAvatarView> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width / 2.1,
        height: MediaQuery.of(context).size.height / 1.58,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff3C3D37),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri("https://graph-taupe-psi.vercel.app/"),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            initialSettings: InAppWebViewSettings(
              supportZoom: false, // Disables zoom to prevent unwanted scaling
              disableHorizontalScroll: true, // Disables horizontal scrolling
              disableVerticalScroll: true, // Disables vertical scrolling
              useWideViewPort: true, // Makes it fit properly
              displayZoomControls: false, // Hides zoom controls
            ),
          ),
        ),
      ),
    );
  }
}

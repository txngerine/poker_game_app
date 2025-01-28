import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../provider/game_view_model.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GameViewModel>().initialize();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<GameViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          return viewModel.serverUrl == null
              ? const Center(child: Text('Failed to load game.'))
              : InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(Uri.parse(viewModel.serverUrl!).toString()),
                  ),
                  initialSettings: InAppWebViewSettings(
                    javaScriptEnabled: true,
                    allowFileAccessFromFileURLs: true,
                    allowUniversalAccessFromFileURLs: true,
                  ),
                );
        },
      ),
    );
  }
}

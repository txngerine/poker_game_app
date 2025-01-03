import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:pokerpad/provider/game_view_model.dart';
import 'package:pokerpad/view/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GameViewModel>(create: (_) => GameViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            onPrimary: Colors.black12,
            seedColor: Colors.black12,
            primary: Colors.black12,
          ),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokerpad/provider/affiliated_button_provider.dart';
import 'package:pokerpad/provider/cashier_button_provider.dart';
import 'package:pokerpad/provider/transfer_button_provider.dart';
import 'package:pokerpad/view/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AffiliatedButtonProvider()),
    ChangeNotifierProvider(create: (_) => CashierButtonProvider()),
    ChangeNotifierProvider(create: (_) => TransferButtonProvider()),
  ], child: const MyApp()));

  // runApp(DevicePreview(
  //     enabled: true,
  //     builder: (context) {
  //       return const MyApp();
  //     }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

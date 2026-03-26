import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hasPin = await StorageService.hasPin();
  runApp(MyApp(hasPin: hasPin));
}

class MyApp extends StatelessWidget {
  final bool hasPin;

  const MyApp({super.key, required this.hasPin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secure Notes',
      theme: ThemeData.dark(),
      home: hasPin ? LoginScreen() : LoginScreen(isFirstTime: true),
    );
  }
}
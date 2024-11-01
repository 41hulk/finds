import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:finds/config/posthog_config.dart';
import 'package:finds/config/database_provider.dart';
import 'package:finds/firebase_options.dart';
import 'package:finds/screens/auth/login_screen.dart';
import 'package:finds/screens/auth/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await PosthogConfig.initialize();
  runApp(
    const ProviderScope(
      child: FindsApp(),
    ),
  );
}

class FindsApp extends StatelessWidget {
  const FindsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finds app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlutterSplashScreen.fadeIn(
        nextScreen: const SignUpScreen(),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: Colors.white,
        childWidget: const Center(
          child: Image(image: AssetImage('assets/images/splash.png')),
        ),
      ),
    );
  }
}

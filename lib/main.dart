import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:finds/provider/auth_provider.dart';
import 'package:finds/provider/sensor_provider.dart';
import 'package:finds/provider/property_provider.dart';
import 'package:finds/screens/auth/login_screen.dart';
import 'package:finds/screens/auth/signup_screen.dart';
import 'package:finds/screens/sensor_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    const FindsApp(),
  );
}

class FindsApp extends StatelessWidget {
  const FindsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => SensorProvider()),
        ChangeNotifierProvider(create: (context) => PropertyProvider()),
      ],
      child: MaterialApp(
        title: 'Finds app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        routes: {
          '/signup': (context) => const SignUpScreen(),
          '/login': (context) => const LoginScreen(),
          '/sensor': (context) => const SensorDisplay(),
        },
        home: FlutterSplashScreen.fadeIn(
          nextScreen: const LoginScreen(),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Colors.white,
          childWidget: const Center(
            child: Image(image: AssetImage('assets/images/splash.png')),
          ),
        ),
      ),
    );
  }
}

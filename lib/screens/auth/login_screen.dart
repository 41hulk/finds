import 'package:flutter/material.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FloatingActionButton.large(
            child: const Text('TRACK ACTION WITH PostHog'),
            onPressed: () async {
              await Posthog().capture(
                eventName: 'Test Button Click',
              );
            },
          ),
        ),
      ),
    );
  }
}

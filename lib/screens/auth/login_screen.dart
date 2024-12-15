import 'package:finds/config/shared_preferences.dart';
import 'package:finds/provider/auth_provider.dart';
import 'package:finds/screens/sensor_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'dart:convert';

import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../navigation/navigation.dart';
import 'package:finds/widgets/custom_text_input.dart'; // Import the custom text input
import 'package:finds/widgets/custom_button.dart'; // Import the custom button

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<dynamic> signInImpl() async {
    try {
      if (_formKey.currentState!.validate()) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        var res = await authProvider.signIn(
          username: _usernameController.text,
          password: _passwordController.text,
        );
        var resBody = json.decode(res.body);

        if (res.statusCode == 200 || res.statusCode == 201) {
          storeUserData(resBody);
          //go to nav here
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          }
        }
      }
    } catch (er) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: er.toString()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Login !🚀',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextInput(
                    label: 'Username',
                    hintText: 'guyntare',
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    label: 'Password',
                    hintText: 'password',
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    child: Text(
                      'You don\'t have an account?, Sign Up',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 74, 77, 80),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Login',
                    onPressed: () async {
                      await signInImpl();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

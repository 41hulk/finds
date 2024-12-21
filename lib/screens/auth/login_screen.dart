import 'package:finds/config/shared_preferences.dart';
import 'package:finds/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    const Text(
                      "Login 🚀",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
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
                      child: const Text(
                        'You don\'t have an account?, Sign Up',
                        style: TextStyle(fontSize: 15),
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
                    SizedBox(height: size.height * 0.026),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black26,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "or",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    InkWell(
                      onTap: () async {},
                      child: socialIcons(
                        size,
                        FontAwesomeIcons.google,
                        "Continue with Google",
                        Colors.pink,
                        27,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding socialIcons(Size size, icon, name, color, double iconSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(),
        ),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.05),
            Icon(
              icon,
              color: color,
              size: iconSize,
            ),
            SizedBox(width: size.width * 0.18),
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

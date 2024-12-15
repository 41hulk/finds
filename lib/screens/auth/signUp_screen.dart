import 'dart:convert';
import 'package:finds/config/shared_preferences.dart';
import 'package:finds/provider/auth_provider.dart';
import 'package:finds/screens/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:finds/widgets/custom_text_input.dart'; // Import the custom text input
import 'package:finds/widgets/custom_button.dart'; // Import the custom button

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nationalityController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _nationalityController.dispose();
    super.dispose();
  }

  Future<dynamic> signUpImpl() async {
    try {
      if (_formKey.currentState!.validate()) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        var res = await authProvider.signUp(
            username: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            nationality: _nationalityController.text);
        var resBody = json.decode(res.body);

        if (res.statusCode == 200 || res.statusCode == 201) {
          storeUserData(resBody);
          //go to nav here
        }
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        }
        if (res.statusCode == 409) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: resBody['message']),
          );
        }
      }
    } catch (er) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(message: "An error occured"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
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
                    'Get Started !🚀',
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
                    label: 'Email',
                    hintText: 'guy@41labs.co',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    label: 'Password',
                    hintText: 'password',
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    label: 'Nationality',
                    hintText: 'Rwandan',
                    controller: _nationalityController,
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    child: Text(
                      'Already have an account? LogIn',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 74, 77, 80),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      await signUpImpl();
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

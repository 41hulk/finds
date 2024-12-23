import 'dart:convert';
import 'package:finds/config/shared_preferences.dart';
import 'package:finds/provider/auth_provider.dart';
import 'package:finds/screens/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();

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
        );
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
                  child: Column(
                    children: [
                      const Text(
                        "Welcome to Finds 🎉",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
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
                      RichText(
                        text: const TextSpan(
                          text:
                              "We'll send a confirmation email, Kindly check you mail shortly.  ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: const Text(
                          'Already have an account? Login',
                          style: TextStyle(fontSize: 15),
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
                    ],
                  ),
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
      padding: const EdgeInsets.only(bottom: 15),
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

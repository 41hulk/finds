import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:finds/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevarmTextInputField(
                    label: 'Email',
                    hintText: 'guy@41labs.co',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16),
                  ElevarmTextInputField(
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
                  ElevarmOutlineButton.text(
                    text: 'Sign Up',
                    height: 40,
                    onPressed: () {
                      try {
                        if (_formKey.currentState!.validate()) {
                          authProvider.signIn(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                          ),
                        );
                      }
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

import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:finds/provider/auth_provider.dart';
import 'package:finds/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
                    label: 'Username',
                    hintText: 'guyntare',
                    controller: _usernameController,
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
                      'Already have an account? LogIn',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 74, 77, 80),
                      ),
                    ),
                    onTap: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      // );
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevarmOutlineButton.text(
                    text: 'Sign Up',
                    height: 40,
                    onPressed: () {
                      try {
                        if (_formKey.currentState!.validate()) {
                          authProvider.signUp(
                            username: _usernameController.text,
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

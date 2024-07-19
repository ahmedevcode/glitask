import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glitask/feature/login/presentation/screens/widgets/custompaint_login.dart';
import 'package:glitask/feature/register/presentation/screens/widgets/custompainter_register.dart';
import '../../../../core/helper/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _showSnackBar(String message, {Color backgroundColor = Colors.red}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopBar_signup(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: const OutlineInputBorder(),
                    errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();
                    User? user = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (user != null) {
                      _showSnackBar('Registration successful!',
                          backgroundColor: Colors.green);
                      setState(() {
                        _errorMessage = '';
                      });
                      // Navigate back to login screen
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    } else {
                      _showSnackBar('Registration failed. Please try again.');
                      setState(() {
                        _errorMessage =
                            'Registration failed. Please try again.';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

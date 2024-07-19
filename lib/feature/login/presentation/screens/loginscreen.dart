import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glitask/feature/login/controller/login_cubit.dart';
import 'package:glitask/feature/login/presentation/screens/widgets/custompaint_login.dart';
import '../../../../core/helper/auth_service.dart';
import '../../../register/presentation/screens/registerscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: const Text('Login')),
      body: Stack(
        children: [
          TopBar_home(),
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
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    } else if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login successful!')),
                      );
                      // Navigate to the TaskManagementScreen here
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }

                    return ElevatedButton(
                      onPressed: () {
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();
                        context.read<LoginCubit>().login(email, password);
                      },
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text('Don\'t have an account? Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

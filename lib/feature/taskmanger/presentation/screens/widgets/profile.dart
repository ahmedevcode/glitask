import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glitask/core/routes/routes.dart';
import 'package:glitask/feature/taskmanger/presentation/screens/widgets/custompaint_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Stack(
        children: [
          const CustompaintProfile(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email: ${user?.email ?? 'Not logged in'}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                _buildLogoutButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, Routes.loginscreen);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: const Text(
        'Logout',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

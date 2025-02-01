import 'package:flutter/material.dart';
import 'package:flutter_supabase/auth/auth_service.dart';
import 'package:flutter_supabase/screens/login_page.dart';

class HomePage extends StatelessWidget {
  final _authService = AuthService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmail = _authService.GetUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.SignOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Bienvenido, $userEmail',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
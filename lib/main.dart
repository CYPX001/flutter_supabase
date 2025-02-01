import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_supabase/auth/auth_service.dart';
import 'screens/login_page.dart'; // Importa la pantalla de login
import 'package:flutter_supabase/auth/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Supabase
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6c3lrYXZ6a2V4YWl4cndoaXhiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc5MDMzMDEsImV4cCI6MjA1MzQ3OTMwMX0.o37FNPwmoKscn3cieZ4nzBAjC1D1gkUTsxKlMXhW0v8",
    url: "https://dzsykavzkexaixrwhixb.supabase.co",
  );

  // Ejecuta la aplicación con AuthGate como pantalla inicial
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Supabase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthGate(), // Usa AuthGate como pantalla inicial
    );
  }
}
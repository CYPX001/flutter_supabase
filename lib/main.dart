import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_supabase/screens/login_page.dart';
import 'package:flutter_supabase/screens/splash_screen.dart';
import 'package:flutter_supabase/screens/home_page.dart';
import 'package:flutter_supabase/auth/auth_service.dart'; // Asegúrate de tener este archivo
import 'package:flutter_supabase/auth/auth_gate.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/splash_screen.dart'; // Asegúrate de importar la SplashScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Supabase
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6c3lrYXZ6a2V4YWl4cndoaXhiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc5MDMzMDEsImV4cCI6MjA1MzQ3OTMwMX0.o37FNPwmoKscn3cieZ4nzBAjC1D1gkUTsxKlMXhW0v8",
    url: "https://dzsykavzkexaixrwhixb.supabase.co",
  );

  // Ejecuta la aplicación con SplashScreen como pantalla inicial
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S2AM - App de control de gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Pantalla inicial ahora es la SplashScreen
      home: const SplashScreen(),
      // Agregar las rutas aquí si las necesitas
      routes: {
        '/login': (context) => const LoginPage(),  // Definir ruta login
        '/expenses': (context) => const ExpensesScreen(),  // Definir ruta de gastos
      },
    );
  }
}

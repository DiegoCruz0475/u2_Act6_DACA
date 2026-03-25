import 'package:flutter/material.dart';
import 'inicio.dart';
import 'login.dart';
import 'registro.dart';
import 'home_page.dart';

// Simulación de base de datos para que el login funcione
class DatosUsuario {
  static List<Map<String, String>> usuariosRegistrados = [
    {'email': 'test@test.com', 'pass': '123456'} // Usuario por defecto
  ];
}

void main() => runApp(const YeyoApp());

class YeyoApp extends StatelessWidget {
  const YeyoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yeyo Dwelings',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const RegistroScreen(),
        '/home': (context) => const HomePage(),
      },
      theme: ThemeData(primaryColor: const Color(0xFF0056A4)),
    );
  }
}
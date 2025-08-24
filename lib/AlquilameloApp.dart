import 'package:alquilamelo_app/LoginScreen.dart';
import 'package:alquilamelo_app/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:alquilamelo_app/SplashScreen.dart';

class AlquilameloApp extends StatelessWidget {
  const AlquilameloApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFF88245); // Naranja
    const navy = Color(0xFF133354);    // Azul oscuro

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alquílamelo',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: primary,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        fontFamily: 'Roboto', // cambia si usas otra fuente
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
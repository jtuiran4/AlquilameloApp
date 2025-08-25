import 'package:alquilamelo_app/LoginScreen.dart';
import 'package:alquilamelo_app/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:alquilamelo_app/SplashScreen.dart';
import 'package:alquilamelo_app/HomeScreen.dart';
import 'package:alquilamelo_app/PerfilScreen.dart';
import 'package:alquilamelo_app/SearchScreen.dart';
import 'package:alquilamelo_app/PropScreen.dart';
import 'package:alquilamelo_app/CheckoutScreen.dart';
import 'package:alquilamelo_app/PaymentScreen.dart';
import 'package:alquilamelo_app/ModificarPerfil.dart';
import 'package:alquilamelo_app/Seguridad.dart';
import 'package:alquilamelo_app/MisReservas.dart';
import 'package:alquilamelo_app/BookingConfirmationPage.dart';

class AlquilameloApp extends StatelessWidget {
  const AlquilameloApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFF88245); 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alquílamelo',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: primary,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        fontFamily: 'Roboto', 
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/perfil': (context) => const PerfilScreen(), 
        '/search': (context) => const SearchScreen(),
        '/propiedad': (context) => const PropertyDetailScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/modificarPerfil': (context) => const ModificarPerfil(),
        '/seguridad': (context) => const Seguridad(),
        '/misReservas': (context) => const MisReservas(),
        '/confirmacion': (context) => const BookingConfirmationPage(),
        },
    );
        
      }
    
  }

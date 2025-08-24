import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFF88245);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              Row(
                children: [
                  Image.asset(
                    'assets/alquilamelologo.png',
                    height: 150,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 50),

              const Text(
                "Identifícate",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: "Correo",
                  prefixIcon: const Icon(Icons.mail_outline),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  const Text("¿No tienes cuenta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/register');
                    },
                    child: const Text(
                      "Regístrate aquí",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    elevation: 2,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Iniciar Sesión"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
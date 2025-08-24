import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFF88245);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Row(
                children: [
                  Image.asset(
                    'assets/alquilamelologo.png',
                    height: 150,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 40),

              // Título
              const Text(
                "Crea tu cuenta",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),

              // Campo Nombre
              _buildTextField(Icons.person_outline, "Nombre"),
              const SizedBox(height: 12),

              // Campo Apellido
              _buildTextField(Icons.person_outline, "Apellido"),
              const SizedBox(height: 12),

              // Campo Fecha de Nacimiento
              _buildTextField(Icons.calendar_today_outlined, "Fecha de Nacimiento"),
              const SizedBox(height: 12),

              // Campo Correo
              _buildTextField(Icons.mail_outline, "Correo"),
              const SizedBox(height: 12),

              // Campo Contraseña
              _buildTextField(Icons.lock_outline, "Contraseña", isPassword: true),
              const SizedBox(height: 30),

              // Botón Registrarse
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
                  child: const Text("Registrarse"),
                ),
              ),
              const SizedBox(height: 20),

              // Link a Iniciar Sesión
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿Ya tienes cuenta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/login'); // vuelve a Login
                    },
                    child: const Text(
                      "Inicia sesión",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir campos de texto con estilo
  static Widget _buildTextField(IconData icon, String hint,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

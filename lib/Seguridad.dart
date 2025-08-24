import 'package:flutter/material.dart';

class Seguridad extends StatefulWidget {
  const Seguridad({super.key});

  @override
  State<Seguridad> createState() => _SeguridadState();
}

class _SeguridadState extends State<Seguridad> {
  final TextEditingController _actualController = TextEditingController();
  final TextEditingController _nuevaController = TextEditingController();
  final TextEditingController _confirmarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Seguridad",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.security, color: Colors.orange),
                SizedBox(width: 10),
                Text(
                  "Cambiar contraseña",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _actualController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña actual",
                hintText: "Ingrese su contraseña actual",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _nuevaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña nueva",
                hintText: "Ingrese su nueva contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _confirmarController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña nueva",
                hintText: "Ingrese su nueva contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Contraseña actualizada")),
                  );
                },
                child: const Text(
                  "Guardar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

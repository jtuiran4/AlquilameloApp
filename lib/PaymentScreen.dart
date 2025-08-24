import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  static const primary = Color(0xFFF88245);

  final _formKey = GlobalKey<FormState>();

  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: primary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/alquilamelologo.png", height: 150),
                          const SizedBox(width: 6),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/perfil');
                        debugPrint("Perfil presionado");
                      },
                        icon: const Icon(Icons.person_outline,
                        color: Color(0xFFF88245), size: 28),
                    ),
                  ],
                ),
              ),

              
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Datos de pago",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                  
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png",
                            height: 28,
                          ),
                          const SizedBox(width: 10),
                          Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
                            height: 28,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/Apple_Pay_logo.svg.png",
                            height: 28,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/Google_Pay_logo.svg.png",
                            height: 28,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: _inputDecor("Número de la tarjeta"),
                            validator: (value) =>
                                value!.isEmpty ? "Ingrese el número" : null,
                          ),
                          const SizedBox(height: 12),

                          
                          TextFormField(
                            decoration: _inputDecor("Titular de la cuenta"),
                            validator: (value) =>
                                value!.isEmpty ? "Ingrese el titular" : null,
                          ),
                          const SizedBox(height: 12),

                      
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  decoration: _inputDecor("MM / AA"),
                                  validator: (value) => value!.isEmpty
                                      ? "Ingrese fecha"
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: _inputDecor("CVV"),
                                  validator: (value) =>
                                      value!.isEmpty ? "Ingrese CVV" : null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Checkbox(
                          value: _accepted,
                          onChanged: (val) =>
                              setState(() => _accepted = val ?? false),
                        ),
                        const Expanded(
                          child: Text(
                              "Aceptar términos y condiciones",
                              style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Precio Final",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$5555",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text("\$555/noche",
                            style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/confirmacion');
                    },
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: const Text("Completar Pago"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}

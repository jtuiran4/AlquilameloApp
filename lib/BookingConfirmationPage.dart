import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
  const BookingConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFF88245);
    const orange = Color(0xFFFF8A4C);
    const orangeDark = Color(0xFFF56A2A);
    const textDark = Color(0xFF1B1B1B);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1F000000),
                    blurRadius: 12,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: primary),
                      onPressed: () => Navigator.pop(context),
                    ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/alquilamelologo.png',
                      height: 150,
                    ),
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

                  const SizedBox(height: 10),

                  
                  Row(
                    children: [
                      _CheckBadge(
                        border: orangeDark,
                        fill: Colors.white,
                        icon: Icons.check_rounded,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Reserva\nCompletada',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.1,
                            fontWeight: FontWeight.w700,
                            color: textDark,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(),

                  const SizedBox(height: 8),
                  const _SectionTitle('Resumen'),

                  const SizedBox(height: 8),
                  
                  const _LabelValueBlock(
                    title: 'Apartamento en la playa',
                    subtitle: 'Miami, FL.',
                  ),

                  const SizedBox(height: 14),
                  const _SectionTitle('Detalles Habitación'),
                  const _LabelValueBlock(
                    title: 'Habitación doble',
                    subtitle: '1 cama doble o 2 camas sencillas\n2 personas',
                  ),

                  const SizedBox(height: 14),
                  
                  _TwoColRows(
                    rows: const [
                      ('Fecha de Entrada', 'Dom 24, agosto 2025'),
                      ('Fecha de Salida', 'Mar 26, agosto 2025'),
                    ],
                  ),

                  const SizedBox(height: 8),

                  
                  const _PriceBlock(
                    label: 'Precio Pagado',
                    amountLine1: '\$\$\$\$\$\$',
                    amountLine2: '\$\$\$\$/\n noche',
                  ),

                  const Spacer(),

                  const SizedBox(height: 8),
                  _PrimaryButton(
                    text: 'Mis reservas',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/misReservas');
                    },
                    gradient: const LinearGradient(
                      colors: [orange, orangeDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _CheckBadge extends StatelessWidget {
  final Color border;
  final Color fill;
  final IconData icon;

  const _CheckBadge({
    required this.border,
    required this.fill,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 66,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fill,
        border: Border.all(color: border, width: 3),
      ),
      child: Icon(icon, size: 38, color: border),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1B1B1B),
      ),
    );
  }
}

class _LabelValueBlock extends StatelessWidget {
  final String title;
  final String? subtitle;
  const _LabelValueBlock({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.5,
            color: Color(0xFF1B1B1B),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.25,
              color: Color(0xFF6B6B6B),
            ),
          ),
        ],
      ],
    );
  }
}

class _TwoColRows extends StatelessWidget {
  final List<(String, String)> rows;
  const _TwoColRows({required this.rows});

  @override
  Widget build(BuildContext context) {
    const leftStyle = TextStyle(
      fontSize: 13,
      color: Color(0xFF6B6B6B),
      fontWeight: FontWeight.w600,
    );
    const rightStyle = TextStyle(
      fontSize: 13,
      color: Color(0xFF1B1B1B),
      fontWeight: FontWeight.w700,
    );

    return Column(
      children: rows
          .map(
            (r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(child: Text(r.$1, style: leftStyle)),
                  Text(r.$2, style: rightStyle),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _PriceBlock extends StatelessWidget {
  final String label;
  final String amountLine1;
  final String amountLine2;
  const _PriceBlock({
    required this.label,
    required this.amountLine1,
    required this.amountLine2,
  });

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontSize: 13,
      color: Color(0xFF6B6B6B),
      fontWeight: FontWeight.w600,
    );
    const amountStyle1 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Color(0xFF1B1B1B),
      letterSpacing: 1.0,
    );
    const amountStyle2 = TextStyle(
      fontSize: 11,
      color: Color(0xFF6B6B6B),
      height: 1.1,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(child: Text('Precio Pagado', style: labelStyle)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amountLine1, style: amountStyle1),
              Text(amountLine2, style: amountStyle2, textAlign: TextAlign.right),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient gradient;

  const _PrimaryButton({
    required this.text,
    required this.onPressed,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          minimumSize: const Size.fromHeight(48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

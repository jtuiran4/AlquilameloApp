import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const primary = Color(0xFFF88245);

  final TextEditingController _lugarCtrl = TextEditingController();
  DateTimeRange? _rango;
  int _huespedes = 1;

  String get _fechasTexto {
    if (_rango == null) return '';
    final i = _rango!.start;
    final f = _rango!.end;
    String dos(int n) => n.toString().padLeft(2, '0');
    return '${dos(i.day)}/${dos(i.month)}/${i.year}  -  ${dos(f.day)}/${dos(f.month)}/${f.year}';
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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

            const SizedBox(height: 40),

            _Etiqueta('Lugar'),
            _ChipField(
              child: TextField(
                controller: _lugarCtrl,
                decoration: _decoracion('¿A dónde quieres ir?',
                    suffix: Icons.place_outlined),
              ),
            ),
            const SizedBox(height: 14),

            _Etiqueta('Fechas'),
            _ChipField(
              onTap: _seleccionarRangoFechas,
              child: IgnorePointer(
                ignoring: true,
                child: TextField(
                  decoration: _decoracion(
                    _fechasTexto.isEmpty ? '¿Cuándo viajas?' : _fechasTexto,
                    suffix: Icons.calendar_today_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),

            _Etiqueta('Huéspedes'),
            _ChipField(
              onTap: _seleccionarHuespedes,
              child: IgnorePointer(
                ignoring: true,
                child: TextField(
                  decoration: _decoracion(
                    '¿Cuántos viajan?  $_huespedes',
                    suffix: Icons.person_outline,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/search');
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    elevation: 3,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: const Text('¿Nos vamos?'),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  InputDecoration _decoracion(String hint, {IconData? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black54),
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      suffixIcon: suffix != null ? Icon(suffix, color: Colors.black54) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
    );
  }

  Future<void> _seleccionarRangoFechas() async {
    final hoy = DateTime.now();
    final inicial = _rango ??
        DateTimeRange(start: hoy.add(const Duration(days: 1)), end: hoy.add(const Duration(days: 4)));
    final r = await showDateRangePicker(
      context: context,
      firstDate: hoy,
      lastDate: hoy.add(const Duration(days: 365 * 2)),
      initialDateRange: inicial,
      helpText: 'Selecciona tus fechas',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(primary: primary),
          ),
          child: child!,
        );
      },
    );
    if (r != null) setState(() => _rango = r);
  }

  Future<void> _seleccionarHuespedes() async {
    int temp = _huespedes;
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Huéspedes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cantidad'),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => setState(() => temp = (temp > 1) ? temp - 1 : 1),
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text('$temp', style: const TextStyle(fontSize: 16)),
                      IconButton(
                        onPressed: () => setState(() => temp += 1),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    setState(() => _huespedes = temp);
                    Navigator.pop(context);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Aceptar'),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}


class _Etiqueta extends StatelessWidget {
  final String text;
  const _Etiqueta(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
    );
  }
}

class _ChipField extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const _ChipField({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    final field = child;
    if (onTap == null) return field;
    return GestureDetector(onTap: onTap, child: field);
  }
}

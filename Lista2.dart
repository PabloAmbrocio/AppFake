import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buscador de Movimientos',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MovimientosPage(),
    );
  }
}

class MovimientosPage extends StatelessWidget {
  const MovimientosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Color(0xFF536471)),
        title: const Text(
          'Buscador de movimientos',
          style: TextStyle(
            color: Color(0xFF1D2C4D),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar movimientos',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  suffixIcon: Icon(Icons.cancel, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Título de la sección y Filtros
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Movimientos',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D215C),
                  ),
                ),
                Icon(Icons.tune, color: Colors.blue[900]), // Icono de filtros
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Subtítulo de fecha
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Este mes',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Lista de movimientos
          Expanded(
            child: ListView(
              children: const [
                MovimientoItem(
                  iniciales: 'PA',
                  colorCirculo: Color(0xFF3F7DFF),
                  titulo: 'Pago YAPE a 191978',
                  fecha: '19 Febrero, 07:32 p.m.',
                  monto: 'S/ -12.00',
                ),
                MovimientoItem(
                  iniciales: 'PA',
                  colorCirculo: Color(0xFF3F7DFF),
                  titulo: 'Pago YAPE a 194918',
                  fecha: '19 Febrero, 08:16 a.m.',
                  monto: 'S/ -5.00',
                ),
                MovimientoItem(
                  iniciales: 'PA',
                  colorCirculo: Color(0xFF3F7DFF),
                  titulo: 'Pago YAPE a 191092',
                  fecha: '19 Febrero, 07:38 a.m.',
                  monto: 'S/ -6.00',
                ),
                MovimientoItem(
                  iniciales: 'PA',
                  colorCirculo: Color(0xFF3F7DFF),
                  titulo: 'Pago YAPE a 191953',
                  fecha: '18 Febrero, 06:17 p.m.',
                  monto: 'S/ -10.50',
                ),
                MovimientoItem(
                  iniciales: 'SB',
                  colorCirculo: Color(0xFF1E63EB),
                  titulo: 'SB - 108 PLAZA NOR',
                  fecha: '17 Febrero, 07:13 p.m.',
                  monto: 'S/ -11.00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget personalizado para cada fila de la lista
class MovimientoItem extends StatelessWidget {
  final String iniciales;
  final Color colorCirculo;
  final String titulo;
  final String fecha;
  final String monto;

  const MovimientoItem({
    super.key,
    required this.iniciales,
    required this.colorCirculo,
    required this.titulo,
    required this.fecha,
    required this.monto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            backgroundColor: colorCirculo,
            radius: 22,
            child: Text(
              iniciales,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF1D2C4D),
            ),
          ),
          subtitle: Text(
            fecha,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                monto,
                style: const TextStyle(
                  color: Color(0xFFD32F2F), // Color rojo para el egreso
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF536471)),
            ],
          ),
        ),
        // Línea divisoria entre elementos
        const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16),
      ],
    );
  }
}

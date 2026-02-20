import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Color azul corporativo del BCP
        primaryColor: const Color(0xFF002A8D),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DetalleCuentaPage(),
    );
  }
}

class DetalleCuentaPage extends StatelessWidget {
  const DetalleCuentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definición de colores constantes para reusar
    const Color azulBCP = Color(0xFF002A8D);
    const Color naranjaBCP = Color(0xFFFF7A00);

    return Scaffold(
      // --- APPBAR (Barra superior azul) ---
      appBar: AppBar(
        backgroundColor: azulBCP,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Cuentas", style: TextStyle(color: Colors.white)),
        actions: [
          // Espacio para el logo en la esquina superior derecha
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/logo_bcp.png', fit: BoxFit.contain),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECCIÓN DE INFORMACIÓN DE CUENTA ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "CUENTAS DE AHORRO",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const Icon(Icons.edit_outlined, color: naranjaBCP, size: 20),
                    ],
                  ),
                  const Text("19137074843035", style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("CCI: 00219113707484303558", style: TextStyle(color: Colors.grey)),
                      const Icon(Icons.share_outlined, color: naranjaBCP, size: 20),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text("Disponible", style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const Text(
                    "S/ 36.64",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: azulBCP),
                  ),
                ],
              ),
            ),

            const Divider(thickness: 1, color: Color(0xFFEEEEEE)),

            // --- SECCIÓN DE ACCIONES RÁPIDAS (Botones naranjas) ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(Icons.swap_horiz, "Transferir\ndinero", naranjaBCP),
                  _buildActionButton(Icons.water_drop_outlined, "Pagar\nservicios", naranjaBCP),
                  //_buildActionButton(FontAwesomeIcons.piggyBank, "Ahorra con\nWardaditos", naranjaBCP),
                  _buildActionButton(Icons.more_horiz, "Más", naranjaBCP),
                ],
              ),
            ),

            const Divider(thickness: 1, color: Color(0xFFEEEEEE)),

            // --- SECCIÓN DE MOVIMIENTOS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Movimientos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: azulBCP),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Ver más", style: TextStyle(color: naranjaBCP, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Hoy", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            ),

            // Lista de transacciones
            _buildMovementItem("Pago YAPE a 194918", "19 Febrero", "-5.00", true),
            _buildMovementItem("Pago YAPE a 191092", "19 Febrero", "-6.00", true),
          ],
        ),
      ),
      
      // --- BARRA DE NAVEGACIÓN INFERIOR ---
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: azulBCP,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Operaciones"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Para ti"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Configuración"),
        ],
      ),
    );
  }

  // Función para construir los botones circulares de acción
  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }

  // Función para construir cada fila de movimiento (transacción)
  Widget _buildMovementItem(String title, String date, String amount, bool isNegative) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFF4A90E2),
        child: Text("PA", style: TextStyle(color: Colors.white, fontSize: 12)),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "S/ $amount",
            style: TextStyle(
              color: isNegative ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.chevron_right, color: Color(0xFF002A8D)),
        ],
      ),
    );
  }
}

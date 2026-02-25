import 'package:flutter/material.dart';

void main() => runApp(const MiBancaApp());

class MiBancaApp extends StatelessWidget {
  const MiBancaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0039A6), // Azul característico
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          children: [
            const SizedBox(height: 20),
            // Sección de Cuentas
            _buildExpansionItem(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Cuentas',
            ),

            const SizedBox(height: 15),

            // Banner de Wardaditos
            _buildWardaditosBanner(),

            const SizedBox(height: 15),

            // Resto de opciones
            _buildExpansionItem(icon: Icons.credit_card, title: 'Tarjetas de débito'),
            const SizedBox(height: 15),
            _buildExpansionItem(icon: Icons.credit_card_outlined, title: 'Tarjetas de crédito'),
            const SizedBox(height: 15),
            _buildExpansionItem(icon: Icons.monetization_on_outlined, title: 'Créditos'),
            const SizedBox(height: 15),
            _buildExpansionItem(icon: Icons.percent, title: 'Fondos Mutuos'),
            const SizedBox(height: 15),
            _buildExpansionItem(icon: Icons.trending_up, title: 'Depósitos a Plazo Fijo'),
            const SizedBox(height: 15),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Widget para las filas expandibles
  Widget _buildExpansionItem({required IconData icon, required String title}) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(icon, color: const Color(0xFF4169E1), size: 26),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0C1B4A),
          ),
        ),
        trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        children: const [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("Aquí aparecerá el detalle de tus productos."),
          )
        ],
      ),
    );
  }

  // Widget para el banner promocional "Wardaditos"
  Widget _buildWardaditosBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Container(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
          color: const Color(0xFFE5F3FB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wardaditos en tu APP',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF3C388A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Organiza tus ahorros automáticos fácilmente.',
                    style: TextStyle(color: Color(0xFF3C388A), fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisSize: MainAxisSize.min, // Keep the row compact
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFC6BAEF),
                  child: Icon(Icons.savings, size: 55, color: Color(0xFFE5F3FB)),
                ),
                // The chevron icon is now directly next to the CircleAvatar in the Row
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Barra de navegación inferior
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF0039A6),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Operaciones'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Configuración'),
      ],
    );
  }
}

import 'package:flutter/material.dart';

// The main function is the entry point of the Flutter application.
void main() {
  runApp(const MiBancaApp());
}

// DATA_MODEL
class Account {
  final String type;
  final String maskedNumber;
  final String balance;

  const Account({
    required this.type,
    required this.maskedNumber,
    required this.balance,
  });
}

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

  // Static list of account data
  static const List<Account> _accountsData = [
    Account(type: 'CUENTAS DE AHORRO', maskedNumber: '**** 3035', balance: 'S/ 3.74'),
    Account(type: 'Corriente Soles', maskedNumber: '**** 7096', balance: 'S/ 1,692.16'),
    Account(type: 'CTS', maskedNumber: '**** 6081', balance: 'S/ 0.74'),
    Account(type: 'CTS Soles', maskedNumber: '**** 9017', balance: 'S/ 2.53'),
  ];

  @override
  Widget build(BuildContext context) {
    // Generate the list of AccountDetailItem widgets from the static data
    // Horizontal padding for these items will be applied in _buildExpansionItem.
    final List<Widget> accountWidgets = _accountsData
        .map<Widget>((account) => AccountDetailItem(account: account))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero, // Removed horizontal padding from ListView
          children: [
            const SizedBox(height: 20),
            // Sección de Cuentas, now with detailed account items
            _buildExpansionItem(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Cuentas',
              childrenContent: accountWidgets, // Pass the generated account widgets
              trailingIcon: const Icon(Icons.keyboard_arrow_up, color: Colors.grey), // Replaced down arrow with up arrow
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

  // Widget para las filas expandibles, now accepting a list of children and a customizable trailing icon
  Widget _buildExpansionItem({
    required IconData icon,
    required String title,
    List<Widget> childrenContent = const [], // New parameter for custom children
    Widget trailingIcon = const Icon(Icons.keyboard_arrow_down, color: Colors.grey), // Custom trailing icon with default
  }) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16.0), // Apply 16.0 horizontal padding to the tile header
        leading: Icon(icon, color: const Color(0xFF4169E1), size: 26),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0C1B4A),
          ),
        ),
        trailing: trailingIcon, // Use the provided trailing icon
        children: childrenContent.isNotEmpty
            ? childrenContent.map<Widget>((widget) =>
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Apply 16.0 horizontal padding to each child
                  child: widget,
                )
              ).toList()
            : const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Also pad the fallback text
                  child: Text(
                    "Aquí aparecerá el detalle de tus productos.",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ],
      ),
    );
  }

  // Widget para el banner promocional "Wardaditos"
  Widget _buildWardaditosBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Changed to 16.0 for consistency with other items
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

// New widget to display individual account details
class AccountDetailItem extends StatelessWidget {
  final Account account;

  const AccountDetailItem({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      // The horizontal padding for this item is now applied by its parent (ExpansionTile's children wrapper).
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF0F0F0), width: 1.0), // Light separator
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.type,
                  style: const TextStyle(
                    fontSize: 13, // Changed from 14 to 13 (one size smaller)
                    fontWeight: FontWeight.w600, // Changed from w500 to bold
                    color: Color(0xFF101010), // Changed from specific blue to black
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  account.maskedNumber,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min, // Keep this row compact
            children: [
              Text(
                account.balance,
                style: const TextStyle(
                  fontSize: 13, // Changed from 14 to 13 (one size smaller)
                  fontWeight: FontWeight.w600, // Changed from w500 to bold
                  color: Color(0xFF101010), // Changed from specific blue to black
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

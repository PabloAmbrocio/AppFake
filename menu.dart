import 'package:flutter/material.dart';
// Se importan iconos adicionales que se asemejan más a los originales, como el de Visa.

// Punto de entrada principal de la aplicación.
void main() => runApp(const MyApp());

// Clase principal que configura el tema y la ruta inicial.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta "DEBUG"
      theme: ThemeData(
        // Definimos el color azul principal del BCP
        primaryColor: const Color(0xFF002A8D),
        // Color de fondo gris claro para el cuerpo de la app
        scaffoldBackgroundColor: const Color(0xFFF4F7FA),
        // Define la fuente por defecto si la tuvieras, ej: fontFamily: 'Flexo'
      ),
      home: const BCPHome(), // La pantalla de inicio
    );
  }
}

// La pantalla principal que contiene toda la estructura de la interfaz.
class BCPHome extends StatelessWidget {
  const BCPHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos SingleChildScrollView para que la pantalla se pueda deslizar verticalmente
      // si el contenido es muy largo para la pantalla.
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. SECCIÓN SUPERIOR (Header azul)
            _buildHeader(),

            // 2. CUERPO PRINCIPAL
            Padding(
              padding: const EdgeInsets.all(16.0), // Margen alrededor del contenido
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinea todo a la izquierda
                children: [
                  // Título de sección "Tus productos" con iconos de ojo y lápiz
                  _buildSectionTitle("Tus productos", icons: [Icons.visibility, Icons.edit]),
                  const SizedBox(height: 10), // Espaciado

                  // Tarjeta de Cuenta de Ahorros
                  _buildProductItem(
                      title: "CUENTAS DE",
                      account: "**** 3035",
                      amount: "S/ *****",
                      // Usamos un icono de FontAwesome que se parece al logo naranja
                      leadingIcon: const Icon(Icons.circle, color: Colors.orange, size: 30)
                  ),
                  const Divider(), // Línea divisoria sutil

                  // Tarjeta de Tarjeta de Crédito
                  _buildProductItem(
                      title: "CTS",
                      account: "**** 6081",
                      amount: "S/ *****",
                      subtitle: "Monto consumido",
                      // Icono de Visa de FontAwesome
                      leadingIcon: const Icon(Icons.vignette, color: Color(0xFF002A8D), size: 30)
                  ),
                  const Divider(), // Línea divisoria sutil

                  // Botón "Ver todos"
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Acción al presionar "Ver todos"
                      },
                      child: const Text("Ver todos", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 3. SECCIÓN DE ACCIONES RÁPIDAS (Botones naranjas redondos)
                  _buildQuickActions(),
                  const SizedBox(height: 30),

                  // 4. SECCIÓN "LO MÁS DESTACADO" (Carrusel horizontal)
                  _buildSectionTitle("Lo más destacado"),
                  const SizedBox(height: 15),
                  _buildHighlights(), // Llama al widget del carrusel
                ],
              ),
            ),
          ],
        ),
      ),
      // Barra de navegación inferior
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ===========================================================================
  // WIDGETS HELPER (Funciones para construir partes de la interfaz)
  // ===========================================================================

  // Construye la cabecera azul superior.
  Widget _buildHeader() {
    return Container(
      // Padding para dar espacio interno, especialmente para la barra de estado superior
      padding: const EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 10),
      width: double.infinity,
      color: const Color(0xFF002A8D), // Color azul BCP
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separa los elementos a los extremos
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                

          // Grupo derecho: Logo y Campana
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye "OCL" a la izquierda y los íconos a la derecha
            children: [
              const Text(
                  'OCL',
                  style: TextStyle(
                    color: Colors.white, // Asegura que el texto "OCL" sea blanco
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              
              // --- NUEVO: SE AGREGA LA IMAGEN DEL LOGO ---
              // Asegúrate de haber configurado el asset en pubspec.yaml como se indicó.
              //Image.asset(
              //  'assets/image_1.png',
              //   height: 30, // Altura controlada para que no sea muy grande
              //  fit: BoxFit.contain,
             // ),
              
              
 // Contenedor para los íconos de búsqueda y notificación
                Row(
                  mainAxisSize: MainAxisSize.min, // Mantiene los íconos juntos
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Icon(Icons.help, color: Colors.white, size: 26), // El ícono de ayuda
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0), // Mantiene el padding derecho original
                      child: Icon(Icons.notifications, color: Colors.white, size: 26), // El ícono de notificación
                    ),
                  ],
                ),
              
            ],
          ),
          
          SizedBox(height: 20),
           // Saludo a la izquierda
          const Text(
            "Hola, CONVERSION",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          )
          
        ],
      ),
    );
  }

  // Construye los títulos de las secciones (ej. "Tus productos").
  // Opcionalmente acepta una lista de iconos para mostrar a la derecha.
  Widget _buildSectionTitle(String title, {List<IconData>? icons}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF002A8D))),
        // Si hay iconos, los mostramos en fila
        if (icons != null)
          Row(
            children: icons.map((icon) => Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(icon, color: Colors.grey[600], size: 24),
            )).toList(),
          ),
      ],
    );
  }

  // Plantilla para un ítem de producto (Cuenta o Tarjeta).
  Widget _buildProductItem({
    required String title, // Nombre del producto (ej. Ahorro Soles)
    required String account, // Número enmascarado
    required String amount, // Monto enmascarado
    required Widget leadingIcon, // El icono del banco a la izquierda
    String? subtitle, // Subtítulo opcional (ej. "Monto consumido")
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          // Icono del producto a la izquierda
          leadingIcon,
          const SizedBox(width: 15),
          // Columna central: Título y número de cuenta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(account, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              ],
            ),
          ),
          // Columna derecha: Monto y flecha
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
              // Si existe subtítulo, se muestra debajo del monto
              if (subtitle != null)
                 Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          )
        ],
      ),
    );
  }

  // Contenedor de los 4 botones circulares naranjas.
  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye el espacio equitativamente
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea arriba por si los textos tienen diferente largo
      children: [
        _quickActionItem(Icons.swap_horiz_rounded, "Transferir\ndinero"),
        _quickActionItem(Icons.water_drop_outlined, "Pagar\nservicios"),
        _quickActionItem(Icons.send_rounded, "Yapear a\ncelular"),
        _quickActionItem(Icons.qr_code_scanner, "Pagar\ncon QR"),
        
        
      ],
    );
  }

  // Plantilla para un solo botón de acción rápida (Icono redondo + Texto).
  Widget _quickActionItem(IconData icon, String label) {
    return Column(
      children: [
        // El círculo naranja
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xFFFF7A00), // Color naranja BCP
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 26),
        ),
        const SizedBox(height: 10),
        // El texto debajo del círculo
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  // El carrusel horizontal de tarjetas destacadas.
  Widget _buildHighlights() {
    return SizedBox(
      height: 145, // Altura fija para el área del carrusel
      child: ListView(
        scrollDirection: Axis.horizontal, // Permite scroll lateral
        // Lista de tarjetas
        children: [
          _highlightCard(
            title: "Ahorra con Wardadito",
            subtitle: "La alcancía virtual del BCP",
            // Usamos un icono temporal, idealmente sería una imagen
            iconWidget: const CircleAvatar(backgroundColor: Color(0xFFE1BEE7), child: Icon(Icons.savings, color: Colors.purple)),
            tagText: "Nuevo"
          ),
           _highlightCard(
            title: "Donaciones",
            subtitle: "Sé parte del cambio",
             iconWidget: const CircleAvatar(backgroundColor: Color(0xFFF8BBD0), child: Icon(Icons.volunteer_activism, color: Colors.pinkAccent)),
            tagText: null // Esta tarjeta no tiene etiqueta azul
          ),
           // Se pueden añadir más tarjetas aquí...
           const SizedBox(width: 20), // Espacio extra al final del scroll
        ],
      ),
    );
  }

  // Plantilla para una tarjeta rectangular del carrusel "Destacado".
  Widget _highlightCard({
    required String title,
    required String subtitle,
    required Widget iconWidget,
    String? tagText, // Etiqueta azul opcional (ej. "Nuevo")
  }) {
    return Container(
      width: 220, // Ancho fijo de la tarjeta
      margin: const EdgeInsets.only(right: 15), // Margen entre tarjetas
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha((255 * 0.05).round()), blurRadius: 10, offset: const Offset(0, 4))
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Fila superior: Icono y Etiqueta opcional
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconWidget, // El icono circular
              if (tagText != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFF002A8D), borderRadius: BorderRadius.circular(20)),
                  child: Text(tagText, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                )
            ],
          ),
          // Textos inferiores
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
               const SizedBox(height: 4),
               Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          )
        ],
      ),
    );
  }

  // Construye la barra de navegación inferior.
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Para que muestre los 4 iconos y textos siempre
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF002A8D), // Color azul para el ítem activo
      unselectedItemColor: Colors.grey, // Color gris para los inactivos
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: 0, // Indica que la primera pestaña ("Inicio") está activa
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Inicio"),
        const BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Operaciones"),
        // Usamos un Container para simular el icono de brújula dentro de un círculo
        BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
                child: const Icon(Icons.explore, size: 18)
            ),
            activeIcon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF002A8D))),
                child: const Icon(Icons.explore, size: 18)
            ),
            label: "Para ti"
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Configuración"),
      ],
    );
  }
}

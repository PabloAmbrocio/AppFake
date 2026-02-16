import 'package:flutter/material.dart';

// La función principal es el punto de entrada de la aplicación Flutter.
void main() {
  runApp(const MyApp());
}

// MyApp es el widget raíz de la aplicación, típicamente un MaterialApp.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Conversión Hola', // Título de la aplicación para el sistema operativo
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HolaConversionPage(), // Establece HolaConversionPage como la pantalla de inicio
    );
  }
}

class HolaConversionPage extends StatelessWidget {
  const HolaConversionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // El fondo de la barra de aplicación es azul
        foregroundColor: Colors.white, // El color predeterminado para los íconos y el texto de la barra es blanco
        // El título ahora es una columna para permitir un diseño de doble fila
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido de la columna a la izquierda
          mainAxisSize: MainAxisSize.min, // La columna ocupa solo el espacio vertical necesario
          children: <Widget>[
            // Primera fila del título: "OCL" y los íconos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye "OCL" a la izquierda y los íconos a la derecha
              children: <Widget>[
                const Text(
                  'OCL',
                  style: TextStyle(
                    color: Colors.white, // Asegura que el texto "OCL" sea blanco
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Contenedor para los íconos de búsqueda y notificación
                Row(
                  mainAxisSize: MainAxisSize.min, // Mantiene los íconos juntos
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.search), // El ícono ya es blanco debido a foregroundColor
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0), // Mantiene el padding derecho original
                      child: Icon(Icons.notifications), // El ícono ya es blanco debido a foregroundColor
                    ),
                  ],
                ),
              ],
            ),
            // Segunda fila del título: "hola Conversion"
            const Text(
              'hola Conversion',
              style: TextStyle(
                color: Colors.white, // Asegura que el texto "hola Conversion" sea blanco
                fontSize: 16,
              ),
            ),
          ],
        ),
        // Se eliminan las acciones ya que los íconos se han movido dentro del widget de título
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.circle_outlined),
            title: Text('Opción 1'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.circle_outlined),
            title: Text('Opción 2'),
          ),
        ],
      ),
    );
  }
}

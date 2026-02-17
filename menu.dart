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
                      child: Icon(Icons.help), // El ícono ya es blanco debido a foregroundColor
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
      body: Column(
        children: <Widget>[
          // Nuevo texto y íconos entre el título y la lista de opciones
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: <Widget>[
                const Text(
                  'Tus productos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(), // Empuja los íconos a la derecha
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.visibility, color: Colors.grey[700]),
                ),
                Icon(Icons.edit, color: Colors.grey[700]),
              ],
            ),
          ),
          // La lista de opciones existente
          Expanded( // Permite que el ListView ocupe el espacio restante
            child: ListView(
              children: <Widget>[
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text('Alicate'),
                subtitle: Text('Alicate universar marca Stanley'),
                // El error "Undefined name 'isSelect'" ocurre porque 'isSelect' no está definido.
                // Dado que 'selected: true' está establecido, asumimos que se pretendía
                // mostrar un ícono de estrella llena para este elemento.
                trailing: Icon(Icons.star), // Se ha cambiado para mostrar siempre el icono de estrella llena
                selected: true,
              ),
            ),
            Card(
              color: Color(0xFFCFD8DC),
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text('Llaves allen'),
                subtitle: Text('4 llaves milimetricas'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text('Amoladora'),
                subtitle: Text('Marca Stanley con 5 discos'),
                trailing: Icon(Icons.more_vert),
                enabled: false,
              ),
            ),
            Card(
              color: Color(0x9966BB6A),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text('Llaves mixtas'),
                subtitle: Text('7 llaves milimétricas'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text('Martillo'),
                subtitle: Text('Martillo de madera marca bellota'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              color: Color(0x3342A5F5),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text('Serrucho'),
                subtitle: Text('Marca Stanley mediano'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text('Taladro'),
                subtitle: Text('Marca Bosh con juego de brocas'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
            ),
          ),
        ],
      ),
    );
  }
}

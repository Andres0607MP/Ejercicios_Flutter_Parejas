import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Control de Asistencia',
      home: InicioScreen(),
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  void abrirPantalla(BuildContext context, Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu principal'),
        backgroundColor: const Color.fromARGB(255, 26, 148, 81),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              Icons.apps,
              size: 90,
              color: const Color.fromARGB(255, 26, 148, 81),
            ),
            SizedBox(height: 15),
            Text(
              'Aplicación de inicio',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Selecciona una opcion para abrir una nueva pantalla',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: const Color.fromARGB(255, 26, 148, 81),
                ),
                title: Text('Listado de Aprendices'),
                subtitle: Text('Consultar informacion de los aprendices'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  //abrirPantalla(context, PerfilScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: const Color.fromARGB(255, 26, 148, 81),
                ),
                title: Text('Cursos'),
                subtitle: Text('Consultar cursos disponibles'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  //abrirPantalla(context, CursoScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: const Color.fromARGB(255, 26, 148, 81),
                ),
                title: Text('Informacion'),
                subtitle: Text('Conocer detalles de la aplicacion'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  //abrirPantalla(context, InfoScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

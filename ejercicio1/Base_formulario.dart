import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InicioScreen());
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
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(Icons.apps, size: 90, color: Colors.indigo),
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
                leading: Icon(Icons.person, color: Colors.indigo),
                title: Text('Perfil'),
                subtitle: Text('Ver informacion del usuario'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, PerfilScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.indigo),
                title: Text('Cursos'),
                subtitle: Text('Consultar cursos disponibles'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, CursoScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.indigo),
                title: Text('Informacion'),
                subtitle: Text('Conocer detalles de la aplicacion'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, InfoScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, size: 90, color: Colors.blue),
                SizedBox(height: 15),
                Text(
                  'Laura Gomez',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text('Aprendiz ADSO', style: TextStyle(fontSize: 16)),
                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Regresar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CursoScreen extends StatelessWidget {
  const CursoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cursos = [
      'Flutter Basico',
      'Base de Datos',
      'HTML y CSS',
      'Pruebas de Software',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Cursos'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cursos.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.book, color: Colors.green),
                  title: Text(cursos[index]),
                  subtitle: Text('Curso disponible para inscripcion'),
                ),
              );
            },
          ),
           ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Regresar al inicio'),
            ),
        ],
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info, size: 90, color: Colors.orange),
            SizedBox(height: 20),
            Text(
              'Esta es una aplicacion que permite practicar la navegacion basica en flutter usando Navigator.push y Navigator.pop',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Regresar al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}


//listView sirve para
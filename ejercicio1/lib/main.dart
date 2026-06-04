import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca Personal',
      home: Lista_biblioteca(),
    );
  }
}

class Lista_biblioteca extends StatelessWidget {
  const Lista_biblioteca({super.key});

  void listaLibros(BuildContext context, Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biblioteca Personal')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(Icons.library_books, size: 90, color: Colors.blueGrey),
            SizedBox(height: 20),
            Text('Bienvenido puedes selcionar la opcion que mas te convenga'),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.indigo),
                title: Text('Perfil'),
                subtitle: Text('Ver informacion del usuario'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  listaLibros(context, Libros());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Libros extends StatelessWidget {
  const Libros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca'),
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
                Icon(
                  leading
                )
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

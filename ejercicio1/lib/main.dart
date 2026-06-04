import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca Personal',
      home: ListaBiblioteca(),
    );
  }
}

class ListaBiblioteca extends StatelessWidget {
  const ListaBiblioteca({super.key});

  void listaLibros(BuildContext context, Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca Personal'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Icon(Icons.library_books, size: 90, color: Colors.blueGrey),
            const SizedBox(height: 20),
            const Text(
              'Bienvenido, puedes seleccionar la opción que más te convenga',
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.book_online, color: Colors.indigo),
                title: const Text('Libros'),
                subtitle: const Text('Ver información de los libros'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  listaLibros(context, const Libros());
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.app_registration,
                  color: Colors.indigo,
                ),
                title: const Text('Registrar Libro'),
                subtitle: const Text(
                  'Registrar un nuevo libro en la biblioteca',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  listaLibros(context, const RegistroLibro());
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.notifications, color: Colors.indigo),
                title: const Text('Notificaciones'),
                subtitle: const Text('Ver notificaciones'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  listaLibros(context, const Notificaciones());
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
      title: const Text('Biblioteca'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    body: Center(
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Magia'),
                  subtitle: const Text(
                    'Autor: J.K. Rowling\n'
                    'Categoría: Fantasía',
                  ),
                  trailing: const Text('Disponible'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: Colors.red,
                  ),
                  title: const Text('Novela'),
                  subtitle: const Text(
                    'Autor: Gabriel García Márquez\n'
                    'Categoría: Literatura',
                  ),
                  trailing: const Text('Prestado'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: Colors.green,
                  ),
                  title: const Text('El Principito'),
                  subtitle: const Text(
                    'Autor: Antoine de Saint-Exupéry\n'
                    'Categoría: Infantil',
                  ),
                  trailing: const Text('Disponible'),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notificaciones(),
                    ),
                  );
                },
                child: const Text('Notificaciones'),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}

class RegistroLibro extends StatefulWidget {
  const RegistroLibro({super.key});

  @override
  State<RegistroLibro> createState() => _RegistroLibroState();
}

class _RegistroLibroState extends State<RegistroLibro> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Libro')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Título del Libro',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el título del libro';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Autor del Libro',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el autor del libro';
                          }
                    
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Categoría del Libro',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la categoría del libro';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Fecha de Publicación',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la fecha de publicación';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Libro registrado exitosamente'),
                              ),
                            );
                          }
                        },
                        child: const Text('Registrar'),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Notificaciones extends StatelessWidget {
  const Notificaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Normas y Recomendaciones'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.warning, color: Colors.orange),
                title: Text('Cuidado de los libros'),
                subtitle: Text(
                  'Evite doblar las páginas o escribir sobre ellas.',
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.menu_book, color: Colors.blue),
                title: Text('Préstamo responsable'),
                subtitle: Text(
                  'Devuelva los libros dentro del tiempo establecido.',
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.no_accounts, color: Colors.red),
                title: Text('Uso personal'),
                subtitle: Text(
                  'No preste los libros a terceros sin autorización.',
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.water_drop, color: Colors.cyan),
                title: Text('Protección'),
                subtitle: Text(
                  'Mantenga los libros alejados de líquidos y alimentos.',
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Buen uso'),
                subtitle: Text(
                  'Utilice separadores de páginas para conservar el material.',
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca Personal',
      home: Eventos_academicos(),
    );
  }
}

class Eventos_academicos extends StatelessWidget {
  const Eventos_academicos({super.key});

  void eventos(BuildContext context, Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos Académicos'),
        backgroundColor: const Color.fromARGB(255, 8, 185, 38),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              Icons.event,
              size: 100,
              color: const Color.fromARGB(255, 8, 185, 38),
            ),
            const SizedBox(height: 20),
            Text('Bienvenido a la sección de eventos'),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: const Color.fromARGB(255, 8, 185, 38),
                ),
                title: Text('lista dinamica'),
                subtitle: Text('Eventos'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  eventos(context, const ListaDinamica());
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: const Color.fromARGB(255, 8, 185, 38),
                ),
                title: Text('detalles de evento'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  eventos(context, const DetallesEventos());
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: const Color.fromARGB(255, 8, 185, 38),
                ),
                title: Text('Formulario de Inscripción'),
                subtitle: Text('Hora del evento'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  eventos(context, const Formularios());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaDinamica extends StatelessWidget {
  const ListaDinamica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos Académicos'),
        backgroundColor: const Color.fromARGB(255, 5, 112, 23),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Bienvenido a la sección de eventos'),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.event,
                        color: const Color.fromARGB(255, 5, 112, 23),
                      ),
                      title: Text('Evento ${index + 1}'),
                      subtitle: Text('Descripción del evento ${index + 1}'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetallesEventos(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
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

class DetallesEventos extends StatelessWidget {
  const DetallesEventos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Evento')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.app_registration,
                    color: Color.fromARGB(255, 104, 180, 53),
                  ),
                  title: Text('Feria Tecnológica'),
                  subtitle: Text(
                    'Fecha: 15/06/2026\n'
                    'Lugar: Auditorio Principal\n'
                    'Duración: 4 horas\n'
                    'Tipo: Conferencia',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.app_registration,
                    color: Color.fromARGB(255, 104, 180, 53),
                  ),
                  title: Text('Feria Mental'),
                  subtitle: Text(
                    'Fecha: 15/06/2026\n'
                    'Lugar: Auditorio Principal\n'
                    'Duración: 4 horas\n'
                    'Tipo: Conferencia',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.app_registration,
                    color: Color.fromARGB(255, 104, 180, 53),
                  ),
                  title: Text('Feria Mental'),
                  subtitle: Text(
                    'Fecha: 15/06/2026\n'
                    'Lugar: Auditorio Principal\n'
                    'Duración: 4 horas\n'
                    'Tipo: Conferencia',
                  ),
                ),
              ),

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


class Formularios extends StatefulWidget {
  const Formularios({super.key});

  @override
  State<Formularios> createState() => _FormulariosState();
}

class _FormulariosState extends State<Formularios> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Inscripción'),
        backgroundColor: const Color.fromARGB(255, 8, 185, 38),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre del participante',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese su nombre';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Correo',
                    ),
                    validator: (value) {
                      if (value == null ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Ingrese un correo válido';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Documento',
                    ),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Mínimo 6 caracteres';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Programa de formación',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese el programa';
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
                            content: Text('Inscripción realizada'),
                          ),
                        );
                      }
                    },
                    child: const Text('Inscribirse'),
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
      ),
    );
  }
}

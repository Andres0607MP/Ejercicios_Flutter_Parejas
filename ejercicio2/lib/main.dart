import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Control de Asistencia',
      home: const InicioScreen(),
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  void abrirPantalla(BuildContext context, Widget pantalla) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pantalla),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu principal'),
        backgroundColor: const Color.fromARGB(255, 26, 148, 81),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Icon(
              Icons.apps,
              size: 90,
              color: Color.fromARGB(255, 26, 148, 81),
            ),
            const SizedBox(height: 15),

            const Text(
              'Aplicación de Control de Asistencia',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Selecciona una opcion para abrir una nueva pantalla',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.school,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Listado de Aprendices'),
                subtitle: const Text(
                  'Consultar informacion de los aprendices',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, const AprendicesScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.edit_document,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Reportar Novedad'),
                subtitle: const Text(
                  'Registrar una novedad de asistencia',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, const NovedadScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.bar_chart,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Resumen Visual'),
                subtitle: const Text(
                  'Ver resumen de asistencias',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, const ResumenScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AprendicesScreen extends StatelessWidget {
  const AprendicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> aprendices = [
      {
        "nombre": "Andres Mancera",
        "ficha": "2876543",
        "estado": "Asistió",
        "icono": Icons.check_circle,
        "color": Colors.green,
      },
      {
        "nombre": "Daniel Luque",
        "ficha": "2876543",
        "estado": "Llegó tarde",
        "icono": Icons.access_time,
        "color": Colors.orange,
      },
      {
        "nombre": "Juan Perez",
        "ficha": "2876543",
        "estado": "No asistió",
        "icono": Icons.cancel,
        "color": Colors.red,
      },
      {
        "nombre": "Carlos Gomez",
        "ficha": "2876543",
        "estado": "Asistió",
        "icono": Icons.check_circle,
        "color": Colors.green,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprendices'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: aprendices.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(
                      aprendices[index]["icono"],
                      color: aprendices[index]["color"],
                    ),
                    title: Text(aprendices[index]["nombre"]),
                    subtitle: Text(
                      "Ficha: ${aprendices[index]["ficha"]}\nEstado: ${aprendices[index]["estado"]}",
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Regresar al inicio'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class NovedadScreen extends StatefulWidget {
  const NovedadScreen({super.key});

  @override
  State<NovedadScreen> createState() => _NovedadScreenState();
}

class _NovedadScreenState extends State<NovedadScreen> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final fechaController = TextEditingController();
  final motivoController = TextEditingController();
  final instructorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportar Novedad'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del aprendiz',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: fechaController,
                decoration: const InputDecoration(
                  labelText: 'Fecha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La fecha es obligatoria';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: motivoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Motivo de la novedad',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Debe tener mínimo 10 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: instructorController,
                decoration: const InputDecoration(
                  labelText: 'Instructor que reporta',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Novedad registrada correctamente',
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResumenScreen extends StatelessWidget {
  const ResumenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen Visual'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              color: Colors.green.shade100,
              child: const ListTile(
                leading: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                title: Text('Asistieron'),
                trailing: Text('15'),
              ),
            ),

            Card(
              color: Colors.orange.shade100,
              child: const ListTile(
                leading: Icon(
                  Icons.access_time,
                  color: Colors.orange,
                ),
                title: Text('Llegaron tarde'),
                trailing: Text('4'),
              ),
            ),

            Card(
              color: Colors.red.shade100,
              child: const ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                title: Text('No asistieron'),
                trailing: Text('2'),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Regresar al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
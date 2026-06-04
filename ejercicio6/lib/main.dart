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
      title: 'Seguimiento de Proyectos',
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
        title: const Text('Dashboard Principal'),
        backgroundColor: const Color.fromARGB(255, 26, 148, 81),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Icon(
              Icons.dashboard,
              size: 90,
              color: Color.fromARGB(255, 26, 148, 81),
            ),

            const SizedBox(height: 15),

            const Text(
              'Seguimiento de Proyectos',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Consulta el avance de los proyectos formativos',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.folder,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Lista de Proyectos'),
                subtitle: Text(
                  'Consultar proyectos registrados',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(
                    context,
                    const ProyectosScreen(),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.assignment,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Reporte de Avance'),
                subtitle: const Text(
                  'Registrar avance del proyecto',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(
                    context,
                    const ReporteAvanceScreen(),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.lightbulb,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Recomendaciones'),
                subtitle: const Text(
                  'Consejos para mejorar el avance',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(
                    context,
                    const RecomendacionesScreen(),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.green.shade100,
              child: const ListTile(
                leading: Icon(
                  Icons.analytics,
                  color: Colors.green,
                ),
                title: Text('Proyectos Activos'),
                trailing: Text(
                  '4',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProyectosScreen extends StatelessWidget {
  const ProyectosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> proyectos = [
      {
        "nombre": "Sistema de Inventario",
        "equipo": "Equipo A",
        "avance": "80%",
        "estado": "En desarrollo",
        "entrega": "15/06/2026",
      },
      {
        "nombre": "Control de Asistencia",
        "equipo": "Equipo B",
        "avance": "65%",
        "estado": "En desarrollo",
        "entrega": "20/06/2026",
      },
      {
        "nombre": "Seguimiento de Proyectos",
        "equipo": "Equipo C",
        "avance": "40%",
        "estado": "Retrasado",
        "entrega": "25/06/2026",
      },
      {
        "nombre": "Inventario de Herramientas",
        "equipo": "Equipo D",
        "avance": "100%",
        "estado": "Finalizado",
        "entrega": "10/06/2026",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: proyectos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.folder_open,
                      color: Colors.green,
                    ),
                    title: Text(
                      proyectos[index]["nombre"],
                    ),
                    subtitle: Text(
                      "Equipo: ${proyectos[index]["equipo"]}\n"
                      "Avance: ${proyectos[index]["avance"]}\n"
                      "Estado: ${proyectos[index]["estado"]}\n"
                      "Próxima entrega: ${proyectos[index]["entrega"]}",
                    ),
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Regresar al inicio',
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ReporteAvanceScreen extends StatefulWidget {
  const ReporteAvanceScreen({super.key});

  @override
  State<ReporteAvanceScreen> createState() =>
      _ReporteAvanceScreenState();
}

class _ReporteAvanceScreenState
    extends State<ReporteAvanceScreen> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final avanceController = TextEditingController();
  final dificultadController = TextEditingController();
  final mejoraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reporte de Avance',
        ),
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
                  labelText: 'Nombre del proyecto',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre del proyecto es obligatorio';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: avanceController,
                decoration: const InputDecoration(
                  labelText: 'Avance actual',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe escribir el avance actual';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: dificultadController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Dificultad encontrada',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Mínimo 10 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: mejoraController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Acción de mejora',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Mínimo 10 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Reporte registrado correctamente',
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Guardar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecomendacionesScreen extends StatelessWidget {
  const RecomendacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recomendaciones',
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text(
                'Realizar seguimiento semanal al avance.',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text(
                'Distribuir tareas equitativamente.',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text(
                'Documentar dificultades encontradas.',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text(
                'Establecer metas claras para cada sprint.',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text(
                'Realizar pruebas constantes durante el desarrollo.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
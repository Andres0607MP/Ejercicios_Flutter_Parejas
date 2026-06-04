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
      title: 'Inventario de Herramientas',
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
        title: const Text('Menú Principal'),
        backgroundColor: const Color.fromARGB(255, 26, 148, 81),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Icon(
              Icons.construction,
              size: 90,
              color: Color.fromARGB(255, 26, 148, 81),
            ),
            const SizedBox(height: 15),

            const Text(
              'Inventario de Herramientas',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Gestiona las herramientas del ambiente de formación',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.inventory,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Lista de Herramientas'),
                subtitle: const Text(
                  'Consultar herramientas disponibles',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, const HerramientasScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.edit_document,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Reportar Herramienta'),
                subtitle: const Text(
                  'Registrar una herramienta',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, const ReporteHerramientaScreen());
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.tips_and_updates,
                  color: Color.fromARGB(255, 26, 148, 81),
                ),
                title: const Text('Recomendaciones'),
                subtitle: const Text(
                  'Cuidados para las herramientas',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, const RecomendacionesScreen());
                },
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.green.shade100,
              child: const ListTile(
                leading: Icon(Icons.inventory_2, color: Colors.green),
                title: Text('Total herramientas'),
                trailing: Text(
                  '20',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HerramientasScreen extends StatelessWidget {
  const HerramientasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> herramientas = [
      {
        "nombre": "Martillo",
        "cantidad": "10",
        "estado": "Disponible",
        "ubicacion": "Estante A",
        "icono": Icons.construction,
        "color": Colors.green,
      },
      {
        "nombre": "Taladro",
        "cantidad": "3",
        "estado": "En uso",
        "ubicacion": "Taller",
        "icono": Icons.handyman,
        "color": Colors.orange,
      },
      {
        "nombre": "Destornillador",
        "cantidad": "7",
        "estado": "Dañado",
        "ubicacion": "Bodega",
        "icono": Icons.build,
        "color": Colors.red,
      },
      {
        "nombre": "Llave Inglesa",
        "cantidad": "5",
        "estado": "Disponible",
        "ubicacion": "Estante B",
        "icono": Icons.build_circle,
        "color": Colors.green,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Herramientas'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: herramientas.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(
                      herramientas[index]["icono"],
                      color: herramientas[index]["color"],
                    ),
                    title: Text(herramientas[index]["nombre"]),
                    subtitle: Text(
                      "Cantidad: ${herramientas[index]["cantidad"]}\n"
                      "Estado: ${herramientas[index]["estado"]}\n"
                      "Ubicación: ${herramientas[index]["ubicacion"]}",
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

class ReporteHerramientaScreen extends StatefulWidget {
  const ReporteHerramientaScreen({super.key});

  @override
  State<ReporteHerramientaScreen> createState() =>
      _ReporteHerramientaScreenState();
}

class _ReporteHerramientaScreenState
    extends State<ReporteHerramientaScreen> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final cantidadController = TextEditingController();
  final estadoController = TextEditingController();
  final observacionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportar Herramienta'),
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
                  labelText: 'Nombre de la herramienta',
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
                controller: cantidadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La cantidad es obligatoria';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: estadoController,
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: observacionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Observación',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'La observación debe tener mínimo 10 caracteres';
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
                        content: Text(
                          'Herramienta registrada correctamente',
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

class RecomendacionesScreen extends StatelessWidget {
  const RecomendacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recomendaciones de Cuidado'),
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
                'Guardar las herramientas en lugares secos.',
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
                'Realizar mantenimiento periódico.',
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
                'Reportar daños inmediatamente.',
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
                'Mantener organizado el inventario.',
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
                'Limpiar las herramientas después de cada uso.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
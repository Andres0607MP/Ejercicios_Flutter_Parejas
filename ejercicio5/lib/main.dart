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
      home: Bienvenida(),
    );
  }
}

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hábitos Saludables")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Icon(Icons.favorite, size: 100, color: Colors.red),
            const Text("Bienvenido a hábitos saludables"),
            const SizedBox(height: 20),

            Card(
              child: ListTile(
                title: const Text("Lista de hábitos"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ListaHabitos(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: const Text("Formulario de compromiso"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Formulario(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: const Text("Consejos"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Consejos(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaHabitos extends StatelessWidget {
  const ListaHabitos({super.key});

  final List<Map<String, String>> habitos = const [
    {
      "nombre": "Tomar agua",
      "beneficio": "Hidratación",
      "frecuencia": "8 vasos diarios"
    },
    {
      "nombre": "Caminar",
      "beneficio": "Mejora circulación",
      "frecuencia": "30 min diarios"
    },
    {
      "nombre": "Dormir bien",
      "beneficio": "Energía",
      "frecuencia": "8 horas"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de hábitos")),
      body: ListView.builder(
        itemCount: habitos.length,
        itemBuilder: (context, index) {
          final h = habitos[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: Text(h["nombre"]!),
              subtitle: Text(
                "Beneficio: ${h["beneficio"]}\nFrecuencia: ${h["frecuencia"]}",
              ),
            ),
          );
        },
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario de compromiso")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nombre del usuario",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Obligatorio" : null,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Hábito a mejorar",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Obligatorio" : null,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Meta semanal",
                ),
                validator: (value) =>
                    value!.length < 5
                        ? "Mínimo 5 caracteres"
                        : null,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Motivo personal",
                ),
                validator: (value) =>
                    value!.length < 10
                        ? "Mínimo 10 caracteres"
                        : null,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Formulario enviado"),
                      ),
                    );
                  }
                },
                child: const Text("Guardar"),
              ),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Regresar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Consejos extends StatelessWidget {
  const Consejos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consejos")),

      body: ListView(
        children: const [
          Card(child: ListTile(title: Text("Tomar 2L de agua"))),
          Card(child: ListTile(title: Text("Dormir 8 horas"))),
          Card(child: ListTile(title: Text("Hacer ejercicio"))),
          Card(child: ListTile(title: Text("Comer frutas"))),
        ],
      ),
    );
  }
}
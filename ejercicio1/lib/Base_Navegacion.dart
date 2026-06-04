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
      home: InscripcionScreen(),
    );
  }
}

class InscripcionScreen extends StatefulWidget {
  const InscripcionScreen({super.key});

  @override
  State<InscripcionScreen> createState() => _InscripcionScreenState();
}

class _InscripcionScreenState extends State<InscripcionScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Controladores de los TextFormField
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController documentoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController actividadController = TextEditingController();

  String resultado = '';

  void registrar() {
    if (formKey.currentState!.validate()) {
      setState(() {
        resultado =
            'Inscripion exitosa: ${nombreController.text} quedo registrado en ${actividadController.text}';
      });
    }
  }

  void limpiar() {
    setState(() {
      nombreController.clear();
      documentoController.clear();
      correoController.clear();
      actividadController.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    nombreController.dispose();
    documentoController.dispose();
    correoController.dispose();
    actividadController.dispose();
    super.dispose();
  }

  bool validarCorreo(String correo) {
    return correo.contains('@') && correo.contains('.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de inscripcion'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Icon(Icons.assignment, size: 90, color: Colors.deepPurple),

                SizedBox(height: 10),
                Text(
                  'Registro de actividad',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    labelText: 'Nombre completo',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    if (value.length < 5) {
                      return 'El nombre debe tener minimo 5 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: documentoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Documento',
                    prefixIcon: Icon(Icons.badge),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El documento es obligatorio';
                    }
                    if (value.length < 10) {
                      return 'El documento debe tener minimo 10 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: correoController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El correo electrónico es obligatorio';
                    }
                    if (!validarCorreo(value)) {
                      return 'Correo no valido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: actividadController,
                  decoration: InputDecoration(
                    labelText: 'Actividad',
                    prefixIcon: Icon(Icons.event),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe de escribir la actividad';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: registrar,
                      child: Text('Registrar')
                    ),

                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: limpiar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Limpiar'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if(resultado.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.green,)
                    ),
                    child: Text(
                      resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )
                    )
                    
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//setState sirve para actualizar el valor de algo en tiempo de ejecucion

//dispose lo que hace es liberar los controladores del campo
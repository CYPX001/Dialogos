import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplos: Tipos de Formulario'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            displayOptions(context);
          },
          child: Text('Mostrar opciones'),
        ),
      ),
    );
  }

  void displayOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.looks_one_rounded),
                title: const Text('Simple Dialog'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimpleDialogForm(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.looks_two_rounded),
                title: const Text('Alert Dialog'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlertDialogForm(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.looks_3_rounded),
                title: const Text('Modal Button Sheet Form'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModalButtonSheetForm(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.looks_4_rounded),
                title: const Text('Snack Bar Form'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SnackBarForm(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class SimpleDialogForm extends StatefulWidget {
  @override
  State<SimpleDialogForm> createState() => _SimpleDialogState();
}

class _SimpleDialogState extends State<SimpleDialogForm> {
  late TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = TextEditingController(); // Inicializa el controlador
  }

  @override
  void dispose() {
    myController.dispose(); // Limpia el controlador al eliminar el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Dialog"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: const InputDecoration(
            hintText: "Escribe aquí...",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('El valor del campo de texto es: ${myController.text}'),
              );
            },
          );
        },
        tooltip: 'Mostrar el valor',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

class AlertDialogForm extends StatefulWidget {
  @override
  State<AlertDialogForm> createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialogForm> {
  late TextEditingController secondController;

  @override
  void initState() {
    super.initState();
    secondController = TextEditingController(); // Inicializa el controlador
  }

  @override
  void dispose() {
    secondController.dispose(); // Limpia el controlador al eliminar el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: secondController,
          decoration: const InputDecoration(
            hintText: "Escribe aquí...",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Texto recibido:'),
                content: Text(secondController.text),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Mostrar el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

class ModalButtonSheetForm extends StatefulWidget {
  @override
  State<ModalButtonSheetForm> createState() => ModalButtonSheetFormState();
}

class ModalButtonSheetFormState extends State<ModalButtonSheetForm> {
  late TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = TextEditingController(); // Inicializa el controlador
  }

  @override
  void dispose() {
    myController.dispose(); // Limpia el controlador al eliminar el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modal Button Sheet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: const InputDecoration(
            hintText: "Escribe aquí...",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Colors.yellow,
                width: 400,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Texto recibido:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Text(myController.text),
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Mostrar el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

class SnackBarForm extends StatefulWidget {
  @override
  State<SnackBarForm> createState() => SnackBarFormState();
}

class SnackBarFormState extends State<SnackBarForm> {
  late TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = TextEditingController(); // Inicializa el controlador
  }

  @override
  void dispose() {
    myController.dispose(); // Limpia el controlador al eliminar el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snack Bar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('El valor del campo de texto es: ${myController.text}'),
            ),
          );
        },
        tooltip: 'Mostrar el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

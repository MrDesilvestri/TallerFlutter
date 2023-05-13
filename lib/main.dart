import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => PrimeraPantalla(),
        '/segunda': (context) => SegundaPantalla(),
        '/tercera': (context) => TerceraPantalla(),
      },
    );
  }
}

class PrimeraPantalla extends StatelessWidget {
  final _controladorTexto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controladorTexto,
              decoration: InputDecoration(
                labelText: 'Ingrese un texto',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Ir a la Segunda Pantalla'),
              onPressed: () {
                final texto = _controladorTexto.text;
                Navigator.pushNamed(context, '/segunda', arguments: texto);
              },
            ),
            ElevatedButton(
              child: Text('Ir a la Tercera Pantalla'),
              onPressed: () {
                Navigator.pushNamed(context, '/tercera');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
        child: Text(
          'El texto ingresado es: $argumento',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class TerceraPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tercera Pantalla'),
      ),
      body: Center(
        child: Image.asset(
          'assets/ice_cube_image.jpg',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
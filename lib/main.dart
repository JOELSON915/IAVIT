import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoramento de Pragas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IA - Monitoramento de Pragas'),
        ),
        body: const Center(
          child: Text('Bem-vindo ao app de IA para agricultura!'),
        ),
      ),
    );
  }
}

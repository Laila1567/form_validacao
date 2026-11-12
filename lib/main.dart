
import 'package:flutter/material.dart';

import 'telas/text_field_exemplo.dart';

import 'telas/form_exemplo.dart';

import 'telas/foco_exemplo.dart';

import 'telas/cadastro_exemplo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulário com Validação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuExemplos(),
    );
  }
}

class MenuExemplos extends StatelessWidget {
  const MenuExemplos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplos Flutter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Aula 08 - Entrada de dados e Formulários',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextFieldExemplo(),
                  ),
                );
              },
              child: const Text('TextEditingController'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context) => const FormExemplo(),
                  ),
                );
              },
              child: const Text('Form e Validação'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
              MaterialPageRoute(
                builder: (context) => const FocoExemplo(),
              ),
            );
          },
          child: const Text('Foco em campos de texto'),
          ),
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroExemplo(),
                ),
              );
            },
           child: const Text('Formulário de Cadastro'),
          ),
          ],  
        ),
      ),
    );
  }
}

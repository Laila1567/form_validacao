
import 'package:flutter/material.dart';

class TextFieldExemplo extends StatefulWidget {
  const TextFieldExemplo({super.key});

  @override
  State<TextFieldExemplo> createState() => _TextFieldExemploState();
}

class _TextFieldExemploState extends State<TextFieldExemplo> {

  // Controller para controlar o campo de texto
  late TextEditingController myController;

  // Inicializa o controller
  @override
  void initState() {
    super.initState();

    myController = TextEditingController();

    // Adiciona um ouvinte para monitorar alterações
    myController.addListener(_printLatestValue);
  }

  // Libera os recursos do controller
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  // Função para imprimir o valor atualizado
  void _printLatestValue() {
    final text = myController.text;

    print('Meu text field: $text (${text.characters.length})');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextEditingController'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Exemplo 1 - onChanged()',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Campo que utiliza onChanged
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite um texto',
                hintText: 'Digite aqui...',
              ),

              onChanged: (text) {
                print(
                  'First text field: $text (${text.characters.length})',
                );
              },
            ),

            const SizedBox(height: 30),

            const Text(
              'Exemplo 2 - TextEditingController',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Campo controlado pelo TextEditingController
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite outro texto',
                hintText: 'Digite aqui...',
              ),
            ),

            const SizedBox(height: 20),

            // Botão para mostrar o texto digitado
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Texto digitado'),
                      content: Text(myController.text),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Mostrar texto'),
            ),

            // Botão para limpar o campo
            ElevatedButton(
              onPressed: () {
                myController.clear();
              },
              child: const Text('Limpar campo'),
            ),
          ],
        ),
      ),
    );
  }
}

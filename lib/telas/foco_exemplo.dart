
import 'package:flutter/material.dart';

class FocoExemplo extends StatefulWidget {
  const FocoExemplo({super.key});

  @override
  State<FocoExemplo> createState() => _FocoExemploState();
}

class _FocoExemploState extends State<FocoExemplo> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode myFocusNodeText;
  late TextEditingController myControllerText;

  @override
  void initState() {
    super.initState();

    myFocusNodeText = FocusNode();
    myControllerText = TextEditingController();
  }

  @override
  void dispose() {
    myFocusNodeText.dispose();
    myControllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foco em campos de texto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Exemplo de controle de foco',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                autofocus: true,
                controller: myControllerText,
                focusNode: myFocusNodeText,
                decoration: const InputDecoration(
                  labelText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu nome';
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
                        content: Text('Processing Data'),
                      ),
                    );

                    myControllerText.clear();
                    myFocusNodeText.requestFocus();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

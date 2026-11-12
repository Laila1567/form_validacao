
import 'package:flutter/material.dart';

class FormExemplo extends StatefulWidget {
  const FormExemplo({super.key});

  @override
  State<FormExemplo> createState() => _FormExemploState();
}

class _FormExemploState extends State<FormExemplo> {

  final _formKey = GlobalKey<FormState>();

  String nome = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form e Validação'),
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
                'Exemplo de formulário',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu nome';
                  }
                  return null;
                },

                onSaved: (value) {
                  nome = value!;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu e-mail';
                  }
                  return null;
                },

                onSaved: (value) {
                  email = value!;
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    _formKey.currentState!.save();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Nome: $nome | E-mail: $email',
                        ),
                      ),
                    );
                  }
                },

                child: const Text('Validar formulário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

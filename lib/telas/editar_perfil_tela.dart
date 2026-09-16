import 'package:flutter/material.dart';

class EditarPerfilTela extends StatefulWidget {
  const EditarPerfilTela({super.key});

  @override
  State<EditarPerfilTela> createState() => _EditarPerfilTelaState();
}

class _EditarPerfilTelaState extends State<EditarPerfilTela> {
  final TextEditingController nomeController =
      TextEditingController(text: 'Victor Hugo');

  final TextEditingController emailController =
      TextEditingController(text: 'victor@email.com');

  void salvar() {
    final nome = nomeController.text;
    final email = emailController.text;

    if (nome.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Perfil atualizado com sucesso!'),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: salvar,
                child: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
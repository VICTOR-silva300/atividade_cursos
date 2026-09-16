import 'package:flutter/material.dart';
import 'editar_perfil_tela.dart';

class PerfilTela extends StatelessWidget {
  const PerfilTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu Perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.indigo,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          const Center(
            child: Text(
              'Victor Hugo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 6),

          const Center(
            child: Text(
              'victor@email.com',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 28),

          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.school,
                    color: Colors.indigo,
                  ),
                  title: Text('Curso atual'),
                  subtitle: Text('Flutter Básico'),
                ),

                Divider(),

                ListTile(
                  leading: Icon(
                    Icons.library_books,
                    color: Colors.indigo,
                  ),
                  title: Text('Quantidade de cursos'),
                  subtitle: Text('4 cursos'),
                ),

                Divider(),

                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.indigo,
                  ),
                  title: Text('Aulas concluídas'),
                  subtitle: Text('18 aulas'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditarPerfilTela(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text('Editar perfil'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
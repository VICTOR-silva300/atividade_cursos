import 'package:flutter/material.dart';

class FavoritosTela extends StatefulWidget {
  const FavoritosTela({super.key});

  @override
  State<FavoritosTela> createState() => _FavoritosTelaState();
}

class _FavoritosTelaState extends State<FavoritosTela> {
  final List<Map<String, dynamic>> favoritos = [
    {
      'nome': 'Flutter Básico',
      'descricao':
          'Curso introdutório sobre desenvolvimento mobile utilizando Flutter.',
      'aulas': 12,
      'icone': Icons.flutter_dash,
    },
    {
      'nome': 'Interface Mobile',
      'descricao':
          'Aprenda a criar interfaces modernas para aplicativos.',
      'aulas': 15,
      'icone': Icons.phone_android,
    },
    {
      'nome': 'Banco de Dados',
      'descricao':
          'Conheça conceitos de armazenamento e banco de dados.',
      'aulas': 18,
      'icone': Icons.storage,
    },
  ];

  void removerFavorito(int indice) {
    setState(() {
      favoritos.removeAt(indice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: favoritos.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não possui favoritos.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final curso = favoritos[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),

                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo.shade50,
                      child: Icon(
                        curso['icone'],
                        color: Colors.indigo,
                      ),
                    ),

                    title: Text(
                      curso['nome'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      '${curso['aulas']} aulas\n${curso['descricao']}',
                    ),

                    isThreeLine: true,

                    trailing: IconButton(
                      onPressed: () {
                        removerFavorito(index);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  final String nome;
  final String descricao;
  final int aulas;
  final IconData icone;
  final bool favorito;
  final VoidCallback onFavorito;

  const CursoCard({
    super.key,
    required this.nome,
    required this.descricao,
    required this.aulas,
    required this.icone,
    required this.favorito,
    required this.onFavorito,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    icone,
                    color: Colors.indigo,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    nome,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: onFavorito,
                  icon: Icon(
                    favorito
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favorito ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              descricao,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons.menu_book,
                  size: 18,
                  color: Colors.indigo,
                ),

                const SizedBox(width: 6),

                Text(
                  '$aulas aulas',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continuar curso'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
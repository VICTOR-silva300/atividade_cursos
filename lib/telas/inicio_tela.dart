import 'package:flutter/material.dart';

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CursosApp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Olá, VICTOR! ',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Continue aprendendo e acompanhe seu progresso.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Curso em andamento',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(18),
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
                        child: const Icon(
                          Icons.flutter_dash,
                          color: Colors.indigo,
                          size: 32,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Text(
                          'Flutter Básico Inicial',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    '9 de 12 aulas concluídas',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const LinearProgressIndicator(
                    value: 8 / 12,
                    minHeight: 10,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    '88% concluído',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Cursos disponíveis',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.school,
                color: Colors.indigo,
              ),
              title: const Text('6 cursos disponíveis'),
              subtitle: const Text(
                'Escolha um curso e comece a estudar.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Resumo do estudante',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _ResumoCard(
                  titulo: 'Iniciados',
                  valor: '4',
                  icone: Icons.play_circle,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _ResumoCard(
                  titulo: 'Concluídos',
                  valor: '1',
                  icone: Icons.check_circle,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _ResumoCard(
                  titulo: 'Aulas',
                  valor: '18',
                  icone: Icons.menu_book,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ResumoCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icone;

  const _ResumoCard({
    required this.titulo,
    required this.valor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Icon(
              icone,
              color: Colors.indigo,
            ),

            const SizedBox(height: 8),

            Text(
              valor,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
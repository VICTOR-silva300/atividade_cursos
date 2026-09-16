import 'package:flutter/material.dart';
import '../widgets/curso_card.dart';

class CursosTela extends StatefulWidget {
  const CursosTela({super.key});

  @override
  State<CursosTela> createState() => _CursosTelaState();
}

class _CursosTelaState extends State<CursosTela> {
  final TextEditingController pesquisaController = TextEditingController();

  String pesquisa = '';

  final List<Map<String, dynamic>> cursos = [
    {
      'nome': 'Flutter Básico',
      'descricao':
          'Curso introdutório sobre desenvolvimento mobile utilizando Flutter.',
      'aulas': 12,
      'icone': Icons.flutter_dash,
      'favorito': true,
    },
    {
      'nome': 'Dart Essencial',
      'descricao':
          'Aprenda os principais conceitos da linguagem Dart.',
      'aulas': 10,
      'icone': Icons.code,
      'favorito': false,
    },
    {
      'nome': 'Interface Mobile',
      'descricao':
          'Aprenda a criar interfaces modernas para aplicativos.',
      'aulas': 15,
      'icone': Icons.phone_android,
      'favorito': true,
    },
    {
      'nome': 'Conexão com API',
      'descricao':
          'Aprenda a conectar seu aplicativo com APIs externas.',
      'aulas': 14,
      'icone': Icons.cloud,
      'favorito': false,
    },
    {
      'nome': 'Banco de Dados',
      'descricao':
          'Conheça conceitos de armazenamento e banco de dados.',
      'aulas': 18,
      'icone': Icons.storage,
      'favorito': true,
    },
    {
      'nome': 'Desenvolvimento Mobile',
      'descricao':
          'Aprenda conceitos importantes para desenvolver aplicativos.',
      'aulas': 20,
      'icone': Icons.developer_mode,
      'favorito': false,
    },
  ];

  List<Map<String, dynamic>> get cursosFiltrados {
    if (pesquisa.isEmpty) {
      return cursos;
    }

    return cursos.where((curso) {
      final nome = curso['nome'].toString().toLowerCase();
      final descricao = curso['descricao'].toString().toLowerCase();

      return nome.contains(pesquisa.toLowerCase()) ||
          descricao.contains(pesquisa.toLowerCase());
    }).toList();
  }

  void pesquisar(String valor) {
    setState(() {
      pesquisa = valor;
    });
  }

  void alterarFavorito(int indice) {
    setState(() {
      cursos[indice]['favorito'] = !cursos[indice]['favorito'];
    });
  }

  @override
  void dispose() {
    pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cursos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: pesquisaController,
              onChanged: pesquisar,
              decoration: InputDecoration(
                hintText: 'Pesquisar curso',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: pesquisa.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          pesquisaController.clear();
                          pesquisar('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: cursosFiltrados.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum curso encontrado.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cursosFiltrados.length,
                      itemBuilder: (context, index) {
                        final curso = cursosFiltrados[index];

                        final indiceOriginal = cursos.indexOf(curso);

                        return CursoCard(
                          nome: curso['nome'],
                          descricao: curso['descricao'],
                          aulas: curso['aulas'],
                          icone: curso['icone'],
                          favorito: curso['favorito'],
                          onFavorito: () {
                            alterarFavorito(indiceOriginal);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
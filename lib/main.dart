import 'package:flutter/material.dart';

import 'telas/inicio_tela.dart';
import 'telas/cursos_tela.dart';
import 'telas/favoritos_tela.dart';
import 'telas/perfil_tela.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EducaApp',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int indiceAtual = 0;

  final List<Widget> telas = const [
    InicioTela(),
    CursosTela(),
    FavoritosTela(),
    PerfilTela(),
  ];

  void mudarTela(int indice) {
    setState(() {
      indiceAtual = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[indiceAtual],

      bottomNavigationBar: NavigationBar(
        selectedIndex: indiceAtual,
        onDestinationSelected: mudarTela,
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Cursos',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
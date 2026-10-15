import 'package:flutter/material.dart';

import 'telas/catalogo_screen.dart';
import 'telas/agendamento_screen.dart';
import 'telas/configuracoes_screen.dart';
import 'widgets/menu_lateral.dart';

// Cores oficiais da identidade visual do BraidBook.
const Color roxoPrincipal = Color(0xFF6A3EC8);
const Color lilas = Color(0xFFA78BFA);
const Color lilasClaro = Color(0xFFE9D8FD);
const Color preto = Color(0xFF121016);

void main() {
  runApp(const BraidBookApp());
}

class BraidBookApp extends StatefulWidget {
  const BraidBookApp({super.key});

  @override
  State<BraidBookApp> createState() => _BraidBookAppState();
}

class _BraidBookAppState extends State<BraidBookApp> {
  // Define o tema inicial do aplicativo.
  ThemeMode temaAtual = ThemeMode.dark;

  // Alterna entre o tema escuro e o tema claro.
  void alternarTema() {
    setState(() {
      temaAtual = temaAtual == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BraidBook',
      debugShowCheckedModeBanner: false,

      // Configuração do tema claro.
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: roxoPrincipal,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F6FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: lilasClaro,
          foregroundColor: preto,
        ),
      ),

      // Configuração do tema escuro.
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: roxoPrincipal,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: preto,
        appBarTheme: const AppBarTheme(
          backgroundColor: preto,
          foregroundColor: lilasClaro,
        ),
      ),

      // Define qual tema será exibido.
      themeMode: temaAtual,

      // Abre a tela inicial do aplicativo.
      home: InicioScreen(
        aoAlternarTema: alternarTema,
        temaEscuro: temaAtual == ThemeMode.dark,
      ),
    );
  }
}

// Primeira tela do BraidBook.
class InicioScreen extends StatelessWidget {
  final VoidCallback aoAlternarTema;
  final bool temaEscuro;

  const InicioScreen({
    super.key,
    required this.aoAlternarTema,
    required this.temaEscuro,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo.
      appBar: AppBar(
        // Botão que abre o menu lateral.
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Abrir menu',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          'BraidBook',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: [
          // Botão para alternar entre claro e escuro.
          IconButton(
            onPressed: aoAlternarTema,
            icon: Icon(temaEscuro ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Alternar tema',
          ),
        ],
      ),

      drawer: MenuLateral(
        temaEscuro: temaEscuro,
        aoAlternarTema: aoAlternarTema,

        // Navega para a tela inicial e fecha o menu.
        aoAbrirInicio: () {
          Navigator.pop(context);
        },

        // Abre o catálogo de tranças.
        aoAbrirCatalogo: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CatalogoScreen()),
          );
        },

        // Abre a tela de agendamento.
        aoAbrirAgendamento: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AgendamentoScreen()),
          );
        },

        // Abre as configurações.
        aoAbrirConfiguracoes: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ConfiguracoesScreen(
                temaEscuro: temaEscuro,
                aoAlternarTema: aoAlternarTema,
              ),
            ),
          );
        },
      ),

      // Conteúdo principal da tela.
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Olá! Seja bem-vinda 💜',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(
                'Seu estilo, seu tempo, sua história.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 24),

              // Cartão de apresentação.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [roxoPrincipal, lilas],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.white, size: 36),
                    SizedBox(height: 16),
                    Text(
                      'Realce sua beleza!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Descubra estilos de tranças '
                      'e encontre sua próxima inspiração.',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Explore os estilos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Primeiros estilos do catálogo.
              const Row(
                children: [
                  Expanded(
                    child: _EstiloCard(icone: Icons.spa, titulo: 'Box Braids'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _EstiloCard(
                      icone: Icons.auto_awesome,
                      titulo: 'Fulani Braids',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Informa ao usuário qual tema está ativo.
              Card(
                child: ListTile(
                  leading: Icon(
                    temaEscuro ? Icons.dark_mode : Icons.light_mode,
                    color: lilas,
                  ),
                  title: const Text('Aparência do aplicativo'),
                  subtitle: Text(
                    temaEscuro
                        ? 'Modo escuro selecionado'
                        : 'Modo claro selecionado',
                  ),
                  trailing: Switch(
                    value: temaEscuro,
                    onChanged: (_) => aoAlternarTema(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget reutilizável para representar cada estilo de trança.
class _EstiloCard extends StatelessWidget {
  final IconData icone;
  final String titulo;

  const _EstiloCard({required this.icone, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Column(
          children: [
            Icon(icone, color: lilas, size: 36),
            const SizedBox(height: 12),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

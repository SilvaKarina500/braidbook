
import 'package:flutter/material.dart';

// Tela de catálogo de tranças do BraidBook.
class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  // Lista inicial de estilos para apresentar no catálogo.
  static const List<Map<String, String>> estilos = [
    {'nome': 'Box Braids', 'descricao': 'Clássicas e versáteis'},
    {'nome': 'Fulani Braids', 'descricao': 'Tranças com detalhes'},
    {'nome': 'Boho Braids', 'descricao': 'Leves e despojadas'},
    {'nome': 'Nagô', 'descricao': 'Tranças rente ao couro cabeludo'},
    {'nome': 'Twist', 'descricao': 'Estilo com torções'},
    {'nome': 'Goddess Braids', 'descricao': 'Tranças com acabamento delicado'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de tranças'),
      ),

      // GridView apresenta os estilos em duas colunas.
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: estilos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemBuilder: (context, index) {
          final estilo = estilos[index];

          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              // Responde ao toque em um estilo.
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Você selecionou ${estilo['nome']}!',
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      size: 38,
                      color: Color(0xFFA78BFA),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      estilo['nome']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      estilo['descricao']!,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

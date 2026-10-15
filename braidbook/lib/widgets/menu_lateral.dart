
import 'package:flutter/material.dart';

// Menu lateral reutilizável do BraidBook.
class MenuLateral extends StatelessWidget {
  // Funções recebidas da tela que utiliza o menu.
  final VoidCallback aoAbrirInicio;
  final VoidCallback aoAbrirCatalogo;
  final VoidCallback aoAbrirAgendamento;
  final VoidCallback aoAbrirConfiguracoes;
  final VoidCallback aoAlternarTema;

  // Informa qual tema está selecionado.
  final bool temaEscuro;

  const MenuLateral({
    super.key,
    required this.aoAbrirInicio,
    required this.aoAbrirCatalogo,
    required this.aoAbrirAgendamento,
    required this.aoAbrirConfiguracoes,
    required this.aoAlternarTema,
    required this.temaEscuro,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Cabeçalho personalizado do menu.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6A3EC8),
                    Color(0xFFA78BFA),
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 42,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'BraidBook',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Tranças, estilo e conexão.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            // Opção para voltar à página inicial.
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Início'),
              onTap: aoAbrirInicio,
            ),

            // Opção para consultar os estilos.
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('Catálogo de tranças'),
              onTap: aoAbrirCatalogo,
            ),

            // Opção para preencher um agendamento.
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Agendamento'),
              onTap: aoAbrirAgendamento,
            ),

            // Opção para acessar as configurações.
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Configurações'),
              onTap: aoAbrirConfiguracoes,
            ),

            const Divider(),

            // Alterna entre os temas claro e escuro.
            SwitchListTile(
              secondary: Icon(
                temaEscuro ? Icons.dark_mode : Icons.light_mode,
              ),
              title: const Text('Tema escuro'),
              value: temaEscuro,
              onChanged: (_) {
                aoAlternarTema();
              },
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'BraidBook',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

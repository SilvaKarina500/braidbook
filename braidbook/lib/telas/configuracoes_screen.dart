
import 'package:flutter/material.dart';

// Tela que apresenta as configurações do aplicativo.
class ConfiguracoesScreen extends StatelessWidget {
  final bool temaEscuro;
  final VoidCallback aoAlternarTema;

  const ConfiguracoesScreen({
    super.key,
    required this.temaEscuro,
    required this.aoAlternarTema,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text('Aparência'),
            subtitle: Text('Personalize o visual do BraidBook'),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Tema escuro'),
            subtitle: Text(
              temaEscuro
                  ? 'Modo escuro ativado'
                  : 'Modo claro ativado',
            ),
            value: temaEscuro,
            onChanged: (_) => aoAlternarTema(),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Sobre o BraidBook'),
            subtitle: Text(
              'Aplicativo de inspiração em tranças ',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Tela para preencher e confirmar um agendamento demonstrativo.
class AgendamentoScreen extends StatefulWidget {
  const AgendamentoScreen({super.key});

  @override
  State<AgendamentoScreen> createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<AgendamentoScreen> {
  // Controlador para ler o nome digitado.
  final TextEditingController nomeController = TextEditingController();

  // Guarda o estilo selecionado.
  String? estiloSelecionado;

  // Guarda a mensagem de retorno ao usuário.
  String mensagem = '';

  // Opções disponíveis no formulário.
  final List<String> estilos = [
    'Box Braids',
    'Fulani Braids',
    'Boho Braids',
    'Nagô',
    'Twist',
  ];

  // Valida os dados e apresenta o resultado.
  void confirmarAgendamento() {
    if (nomeController.text.trim().isEmpty || estiloSelecionado == null) {
      setState(() {
        mensagem = 'Preencha seu nome e selecione um estilo.';
      });
      return;
    }

    setState(() {
      mensagem =
          'Agendamento demonstrativo preparado para '
          '${nomeController.text.trim()} '
          'com o estilo $estiloSelecionado!';
    });
  }

  @override
  void dispose() {
    // Libera o controlador quando a tela é encerrada.
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agendamento')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vamos escolher seu próximo estilo?',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Campo de entrada para o nome.
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Seu nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              onChanged: (_) {
                // Atualiza a interface conforme necessário.
                setState(() {
                  mensagem = '';
                });
              },
            ),
            const SizedBox(height: 20),

            // Seleção de estilo de trança.
            DropdownButtonFormField<String>(
              initialValue: estiloSelecionado,
              decoration: const InputDecoration(
                labelText: 'Escolha o estilo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.auto_awesome),
              ),
              items: estilos.map((estilo) {
                return DropdownMenuItem<String>(
                  value: estilo,
                  child: Text(estilo),
                );
              }).toList(),
              onChanged: (valor) {
                setState(() {
                  estiloSelecionado = valor;
                  mensagem = '';
                });
              },
            ),
            const SizedBox(height: 24),

            // Botão de confirmação.
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: confirmarAgendamento,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Confirmar agendamento'),
              ),
            ),
            const SizedBox(height: 16),

            // Feedback visual após a ação.
            if (mensagem.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(mensagem),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

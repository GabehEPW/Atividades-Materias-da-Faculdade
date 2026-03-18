import 'dart:math';
import 'package:flutter/material.dart';
import 'resultado_screen.dart';

class SelecionarScreen extends StatelessWidget {
  const SelecionarScreen({super.key});

  String _sortearEscolhaComputador() {
    final opcoes = ['pedra', 'papel', 'tesoura'];
    final random = Random();
    return opcoes[random.nextInt(opcoes.length)];
  }

  String _definirResultado(String jogador, String computador) {
    if (jogador == computador) {
      return 'empate';
    }

    if ((jogador == 'pedra' && computador == 'tesoura') ||
        (jogador == 'papel' && computador == 'pedra') ||
        (jogador == 'tesoura' && computador == 'papel')) {
      return 'vitoria';
    }

    return 'derrota';
  }

  void _jogar(BuildContext context, String escolhaJogador) {
    final escolhaComputador = _sortearEscolhaComputador();
    final resultado = _definirResultado(escolhaJogador, escolhaComputador);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoScreen(
          escolhaJogador: escolhaJogador,
          escolhaComputador: escolhaComputador,
          resultado: resultado,
        ),
      ),
    );
  }

  Widget _botaoOpcao(
      BuildContext context,
      String nome,
      String imagem,
      ) {
    return GestureDetector(
      onTap: () => _jogar(context, nome),
      child: Column(
        children: [
          Image.asset(
            imagem,
            width: 90,
            height: 90,
          ),
          const SizedBox(height: 8),
          Text(
            nome[0].toUpperCase() + nome.substring(1),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecionar'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/padrao.png', // ✅ correto
              width: 140,
              height: 140,
            ),
            const SizedBox(height: 20),
            const Text(
              'Escolha uma opção',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _botaoOpcao(context, 'pedra', 'assets/pedra.png'),
                _botaoOpcao(context, 'papel', 'assets/papel.png'),
                _botaoOpcao(context, 'tesoura', 'assets/tesoura.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
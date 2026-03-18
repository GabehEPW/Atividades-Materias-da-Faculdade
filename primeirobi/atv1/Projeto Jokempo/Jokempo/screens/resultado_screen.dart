import 'package:flutter/material.dart';

class ResultadoScreen extends StatelessWidget {
  final String escolhaJogador;
  final String escolhaComputador;
  final String resultado;

  const ResultadoScreen({
    super.key,
    required this.escolhaJogador,
    required this.escolhaComputador,
    required this.resultado,
  });

  String _imagemEscolha(String escolha) {
    switch (escolha) {
      case 'pedra':
        return 'assets/pedra.png';
      case 'papel':
        return 'assets/papel.png';
      case 'tesoura':
        return 'assets/tesoura.png';
      default:
        return 'assets/padrao.png';
    }
  }

  String _imagemResultado(String resultado) {
    switch (resultado) {
      case 'vitoria':
        return 'assets/icons8-vitoria-48.png';
      case 'derrota':
        return 'assets/perder.png';
      default:
        return 'assets/icons8-aperto-de-maos-100.png';
    }
  }

  String _textoResultado(String resultado) {
    switch (resultado) {
      case 'vitoria':
        return 'Você venceu!';
      case 'derrota':
        return 'Você perdeu!';
      default:
        return 'Empate!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sua escolha',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              _imagemEscolha(escolhaJogador),
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Escolha do computador',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              _imagemEscolha(escolhaComputador),
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 30),
            Image.asset(
              _imagemResultado(resultado),
              width: 70,
              height: 70,
            ),
            const SizedBox(height: 10),
            Text(
              _textoResultado(resultado),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Jogar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
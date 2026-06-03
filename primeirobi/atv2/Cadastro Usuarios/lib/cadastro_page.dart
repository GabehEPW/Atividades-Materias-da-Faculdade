import 'package:flutter/material.dart';
import 'confirmacao_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? sexoSelecionado;
  bool aceitouTermos = false;

  void validarCadastro() {

    String nome = nomeController.text.trim();
    String idadeTexto = idadeController.text.trim();
    String email = emailController.text.trim();

    if (nome.isEmpty) {
      mostrarErro("Nome não pode ser vazio");
      return;
    }

    if (idadeTexto.isEmpty) {
      mostrarErro("Idade não pode ser vazia");
      return;
    }

    int idade;

    try {
      idade = int.parse(idadeTexto);
    } catch (e) {
      mostrarErro("Idade deve ser um número");
      return;
    }

    if (idade < 18) {
      mostrarErro("Idade deve ser maior ou igual a 18");
      return;
    }

    if (email.isEmpty) {
      mostrarErro("Email não pode ser vazio");
      return;
    }

    if (!email.contains("@") || !email.contains(".")) {
      mostrarErro("Email inválido");
      return;
    }

    if (sexoSelecionado == null) {
      mostrarErro("Selecione o sexo");
      return;
    }

    if (!aceitouTermos) {
      mostrarErro("Você deve aceitar os termos");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmacaoPage(
          nome: nome,
          idade: idade,
          email: email,
          sexo: sexoSelecionado!,
          termos: aceitouTermos,
        ),
      ),
    );
  }

  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "Preencha os campos abaixo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nomeController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Digite seu nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: idadeController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Digite sua idade",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Digite seu email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                hint: const Text("Selecione o sexo"),
                value: sexoSelecionado,
                items: const [
                  DropdownMenuItem(
                    value: "Masculino",
                    child: Text("Masculino"),
                  ),
                  DropdownMenuItem(
                    value: "Feminino",
                    child: Text("Feminino"),
                  ),
                  DropdownMenuItem(
                    value: "Outro",
                    child: Text("Outro"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    sexoSelecionado = value;
                  });
                },
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: aceitouTermos,
                    onChanged: (value) {
                      setState(() {
                        aceitouTermos = value!;
                      });
                    },
                  ),
                  const Text("Aceito os termos de uso"),
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: validarCadastro,
                child: const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
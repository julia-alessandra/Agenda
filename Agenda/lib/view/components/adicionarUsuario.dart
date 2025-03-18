import 'package:agenda/services/firestore_usuario.dart';
import 'package:flutter/material.dart';

class AdicionarUser extends StatelessWidget {
  final FirestoreService firestore;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  AdicionarUser({Key? key, required this.firestore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Nome'),
        TextField(
          controller: nomeController,
        ),
        const SizedBox(height: 10),
        const Text('Email'),
        TextField(
          controller: emailController,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            firestore.addUsuario(nomeController.text, emailController.text);
            nomeController.clear();
            emailController.clear();
          },
          child: const Text("Adicionar Usuário"),
        ),
        ElevatedButton(
          onPressed: (){

          },
          child: const Text("Fazer login"),
        ),
      ],
    );
  }
}

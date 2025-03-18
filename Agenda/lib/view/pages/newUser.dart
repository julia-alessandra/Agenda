import 'package:agenda/view/components/adicionarUsuario.dart';
import 'package:flutter/material.dart';
import 'package:agenda/services/firestore_usuario.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem-vindo!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Crie sua conta ou faça login",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            AdicionarUser(firestore: FirestoreService()), // Chama o widget de adicionar usuário
          ],
        ),
      ),
    );
  }
}

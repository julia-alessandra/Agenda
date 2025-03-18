import 'package:agenda/view/components/tarefa_dialog.dart';
import 'package:agenda/view/components/tarefa_list.dart';
import 'package:flutter/material.dart';
import 'package:agenda/services/firestore_tarefa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Instância do FirestoreService
  final FirestoreService firestore = FirestoreService();

  // Controladores de texto
  final TextEditingController textController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_rounded),
        title: const Text("Agenda Legal"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openTarefaBox(context, firestore, textController, descricaoController, dateController);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TarefaList(firestore: firestore),
      ),
    );
  }
}

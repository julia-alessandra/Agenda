import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agenda/services/firestore_tarefa.dart';

class TarefaList extends StatelessWidget {
  final FirestoreService firestore;

  const TarefaList({Key? key, required this.firestore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.getTarefasStream(),
      builder: (context, snapshot) {


        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('Nenhuma tarefa mor'));
        }

        List tarefasList = snapshot.data!.docs;

        return ListView.builder(
          itemCount: tarefasList.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = tarefasList[index];
            String docID = document.id;
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            String tarefaText = data['titulo'];
            String tarefaDescricao = data['descricao'];
            String tarefaData = data['Data tarefa'];

            return Container(
              color: const Color(0xFFc9c1e5), // Cor de fundo (0xFF + cod hex da cor)
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  tarefaText,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(tarefaDescricao),
                leading: Text(tarefaData),
                trailing:   IconButton(
                  onPressed: () => firestore.deleteTarefa(docID),
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

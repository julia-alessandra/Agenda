import 'package:flutter/material.dart';
import 'package:agenda/services/firestore_tarefa.dart';

// Função que abre o diálogo para adicionar tarefa
void openTarefaBox(BuildContext context, FirestoreService firestore,
    TextEditingController textController, TextEditingController dateController, TextEditingController descricaoController) {

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Adicionar nova tarefa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Titulo da tarefa'),
          TextField(
            controller: textController,
          ),
          Text('Descrição da tarefa'),
          TextField(
            controller: descricaoController,
          ),
          Text('Data da tarefa'),
          TextField(
            controller: dateController,
            readOnly: true,
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2666),
              );
              if (selectedDate != null) {
                dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
              }
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            firestore.addTarefa(textController.text, dateController.text, descricaoController.text);
            textController.clear();
            descricaoController.clear();
            dateController.clear();
            Navigator.of(context).pop();
          },
          child: const Text("Adicionar"),
        ),
      ],
    ),
  );
}

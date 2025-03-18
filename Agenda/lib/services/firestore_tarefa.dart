import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final CollectionReference tarefas =
    FirebaseFirestore.instance.collection('tarefas');

  //Adicionar nova tarefa
  Future<void> addTarefa(String tarefa, String data, String descricao){
    return tarefas.add({
      'titulo': tarefa,
      'descricao': descricao,
      'Data tarefa': data,
      'horario': Timestamp.now()
    });
  }
  //Ler tarefas
  Stream<QuerySnapshot> getTarefasStream(){
    final tarefasStream =
        tarefas.orderBy('horario', descending: true).snapshots();

    return tarefasStream;
  }

  //Remover tarefas
  Future<void> deleteTarefa(String docID){
    return tarefas.doc(docID).delete();
  }
}
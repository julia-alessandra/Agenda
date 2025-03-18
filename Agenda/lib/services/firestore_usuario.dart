import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final CollectionReference usuarios =
  FirebaseFirestore.instance.collection('usuarios');

  //Adicionar nova tarefa
  Future<void> addUsuario(String nome, String email){
    return usuarios.add({
      'Nome': nome,
      'email': email,
      'horario de criacao': Timestamp.now()
    });
  }

}
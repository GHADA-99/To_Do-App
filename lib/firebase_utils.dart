import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/data/todo.dart';

CollectionReference<Todo> getCollectionReferenceWithConverter(){
 return FirebaseFirestore.instance.collection(Todo.collectionName).
  withConverter<Todo>(fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
      toFirestore: (item, _) => item.toJson());
}


Future<void> addTaskToFirebase(String title, String description, DateTime date, bool isDone){
  CollectionReference<Todo> collectionRef = getCollectionReferenceWithConverter();
  //create new document with id in my collection
  DocumentReference<Todo> doc=collectionRef.doc();
  Todo item=Todo(id: doc.id, title: title, description: description, date: date);
  //set return future of void functions so to listen updates we've onError/then 'success'/on time out'cannot connect with server'
  return doc.set(item);

}
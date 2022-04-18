import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/todo.dart';

CollectionReference<Task> getCollectionReferenceWithConverter(){
 return FirebaseFirestore.instance.collection(Task.collectionName).
  withConverter<Task>(fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
      toFirestore: (task, option) => task.toJson());
}

//write data
Future<void> addTaskToFirebase(Task task)async {
  CollectionReference<Task> collectionRef = getCollectionReferenceWithConverter();
  //create new document with id in my collection
  DocumentReference<Task> doc=collectionRef.doc();
  task.id=doc.id;
 return doc.set(task);
  // //set return future of void functions so to listen updates we've onError/then 'success'/on time out'cannot connect with server'
}

//read data 'real time changes'
Stream<QuerySnapshot<Task>> getTaskTFromFirebase(DateTime dateTime){
  CollectionReference<Task> collectionRef = getCollectionReferenceWithConverter();
  return collectionRef
       .where('date',isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .snapshots();
}


//read data with provider  'real time changes'
void reloadData(List<Task>tasksList){
  //reference 3la el document ely b listen 3leha w hea collectionName='Todo tasks'
  //get all data fi el collection deh
  //as return future so we use .then()
  //returned type from get --> future of query snapShot of task bss ana 3aez 27wlha l list of tasks so we use .map function
   getCollectionReferenceWithConverter().get().then((data) {
    //document type-->QueryDocumentSnapShot<tasks>
    //.data type -->tasks
    tasksList = data.docs.map((document) {
      return document.data();
    }).toList();  //list of tasks
  }) ;
}


//delete data
Future<void> deleteTask(Task task){
  CollectionReference<Task> collectionRef =  getCollectionReferenceWithConverter();
 return collectionRef.doc(task.id).delete();
}

//update data

Future<void> updateTask(Task task){
  CollectionReference<Task> collectionRef =  getCollectionReferenceWithConverter();
  return collectionRef.doc(task.id).update({
    'title':task.title,
    'description':task.description,
    'date':task.date
  });
}
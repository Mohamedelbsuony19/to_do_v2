import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/user-model.dart';

CollectionReference<taskModel>getColliction(){
   var collection=FirebaseFirestore.instance.collection('tasks')
      .withConverter<taskModel>(
      fromFirestore: (snapShot,options)=>taskModel.fromJson(snapShot.data()!),
      toFirestore: (task,options)=>task.toJson());
   return collection;

}
Future<void> addToFireBase(taskModel task){
 var colliction=getColliction();
 var docRev=colliction.doc();
 task.id=docRev.id;
 return docRev.set(task);
}
Future<QuerySnapshot<taskModel>> getTasks(DateTime dateTime){
return getColliction().where('date',isEqualTo:DateUtils.dateOnly(dateTime) .microsecondsSinceEpoch)
    .get();
}
void deleteTask(taskModel task){
  getColliction()
      .doc(task.id).delete();
}
void updateFire(taskModel task){
  getColliction().doc(task.id).update({'isDone':task.isDone?false:true});
}
import 'package:flutter/material.dart';
import 'package:untitled/models/user-model.dart';
import 'package:untitled/shared/fire_base/fire_base_utils.dart';

class listTasksProvider extends ChangeNotifier{
  late DateTime selectedDate=DateTime.now();
  void onDateChange(DateTime date){
    selectedDate=date;
    notifyListeners();
  }
  void delete(taskModel task){
    deleteTask(task);
    notifyListeners();
  }
  void update(taskModel task){
    updateFire(task);
    notifyListeners();
  }
}
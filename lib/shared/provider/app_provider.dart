import 'package:flutter/material.dart';
import 'package:untitled/modules/settings/setting_screen.dart';

import '../../modules/taskes_list/tasks_list_screen.dart';

class appProvider extends ChangeNotifier{
late int curent=0;
late List screens=[
  tasksListScreen(),
  settingsScreen()
];
 changeScreen(int index){
    curent=index;
    notifyListeners();
}
}
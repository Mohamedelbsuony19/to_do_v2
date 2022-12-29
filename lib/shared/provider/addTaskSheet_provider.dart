import 'package:flutter/material.dart';
import 'package:untitled/shared/fire_base/fire_base_utils.dart';

import '../../models/user-model.dart';
import '../componente/componetes.dart';

class addTaskSheetProvider extends ChangeNotifier{
  late String title='';
  late String des='';
  late DateTime selectedDate=DateTime.now();
  late List<taskModel> tasks=[];
  GlobalKey<FormState>formControl=GlobalKey<FormState>();

  void onChangeTitle(String text){
    title=text;
    notifyListeners();
  }
  void onChangeDesc(String text){
    des=text;
    notifyListeners();
  }
  void chooseDate(BuildContext context) async{
    var chossenDate= await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if(chossenDate !=null){
      selectedDate=chossenDate;
    }
    notifyListeners();
  }
  void addTask(BuildContext context) {
    if(formControl.currentState?.validate()==true){
      taskModel task=taskModel(
          tittle:title ,
          descrption: des,
          date:DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch,
      );
      showLoading('loading...', context);
      addToFireBase(task).then((value){
        hidenLoaing(context);
        showMessage(context, 'Task was added successfully', 'ok', () {
          Navigator.pop(context);
          Navigator.pop(context);

        });
      }
      ).catchError((e){
        hidenLoaing(context);
        showMessage(context, 'Try', 'ok', () {
          Navigator.pop(context);
        });
      });
      notifyListeners();
    }
  }




}
import 'package:calender_picker/date_picker_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/user-model.dart';
import 'package:untitled/modules/taskes_list/task_widget.dart';
import 'package:untitled/shared/fire_base/fire_base_utils.dart';
import 'package:untitled/shared/provider/list-tasks-prvider.dart';
import '../../shared/provider/addTaskSheet_provider.dart';
import '../../shared/provider/setting-provider.dart';

class tasksListScreen extends StatelessWidget {
  static const String routeName = 'tasks';
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<addTaskSheetProvider>(context);
    var proo = Provider.of<listTasksProvider>(context);
    var pr0oo = Provider.of<settingProvider>(context);


    return Container(
      child: Column(
        children: [
          CalenderPicker(
            DateTime.now(),
            initialSelectedDate:proo.selectedDate,
            selectionColor:pr0oo.isLight?Colors.white:Color(0xFF707070),
            selectedTextColor: Theme.of(context).primaryColor,
            daysCount: 500,
            onDateChange: (date) {
                proo.onDateChange(date);
            },
            enableMultiSelection: false,
          ),
          Expanded(
            child: FutureBuilder<QuerySnapshot<taskModel>>(
              future: getTasks(proo.selectedDate),
              builder: (BuildContext, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapShot.hasError) {
                  return Text('some thing went rerror');
                } else {
                  pro.tasks =
                      snapShot.data?.docs.map((e) => e.data()).toList() ?? [];
                  return ListView.builder(
                      itemCount: pro.tasks.length,
                      itemBuilder: (BuildContext, index) {
                        return taskWedget(pro.tasks[index]);
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

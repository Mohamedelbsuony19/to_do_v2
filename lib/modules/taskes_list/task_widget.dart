import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/user-model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:untitled/modules/edit task/edit_task_screen.dart';
import 'package:untitled/shared/provider/setting-provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/provider/list-tasks-prvider.dart';

class taskWedget extends StatelessWidget {
  taskModel task;
  taskWedget(this.task);

  @override
  Widget build(BuildContext context) {
  var proo = Provider.of<listTasksProvider>(context);
  var pro = Provider.of<settingProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: DrawerMotion(),
        children: [
          SlidableAction(onPressed: (BuildContext){
        proo.delete(task);
          },
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete_outline_outlined,
            label: 'Delete',
          )
        ],
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(
            context,
            editTaskScreen.routeName,
            arguments:task,
          );
        },
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color:pro.isLight? Colors.white: Color(0xFF707070),
              borderRadius: BorderRadius.circular(12)
          ),

          child: Row(
            children: [
             task.isDone?
             Container(
               color: Colors.green,
               width: 4,
               height: 80,
             )
             :
             Container(
                color:Color(0xFF5D9CEC),
                width: 4,
                height: 80,
              )
              ,

              Expanded(
                  child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(task.tittle,
                      style:Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: task.isDone?Colors.green:Color(0xFF5D9CEC),
                        fontSize: task.isDone?25:22,
                        fontWeight:FontWeight.bold
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(task.descrption,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color:pro.isLight?Colors.black:Colors.white ,
                      ),
                    ),
                  ),
                ],
              )
              ),
              InkWell(
                onTap: (){
                  proo.update(task);
                },
                child: task.isDone?
                Container(
                  child:Text(AppLocalizations.of(context)!.done,style:TextStyle(color:Colors.white) ,),
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(18),
                  ),
                )
                    :
                Container(
                  child: Icon(Icons.check_circle,color: Colors.white,),
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                  decoration: BoxDecoration(
                    color: Color(0xFF5D9CEC),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

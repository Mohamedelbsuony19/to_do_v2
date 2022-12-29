import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/user-model.dart';
import 'package:untitled/shared/componente/componetes.dart';
import 'package:untitled/shared/provider/addTaskSheet_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class addBtnSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<addTaskSheetProvider>(context);
    return SingleChildScrollView(

      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                topRight: Radius.circular(15))
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.addNewTask,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.black
            ),
              textAlign: TextAlign.center,
            ),
            Form(
                key: pro.formControl,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.title
                  ),
                  onChanged: (v){
                    pro.onChangeTitle(v);
                  },
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'Please Enter Title';
                    }return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText:AppLocalizations.of(context)!.taskDetalis,
                  ),
                  onChanged: (v){
                    pro.onChangeDesc(v);
                  },
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'Please Enter Descrption';
                    }return null;
                  },

                  maxLines: 4,
                  minLines: 4,
                ),
                SizedBox(height: 12,),
                Text(AppLocalizations.of(context)!.selectTime),
                SizedBox(height: 12,),
                InkWell(
                    onTap: (){
                      pro.chooseDate(context);
                      },
                    child: Text('${pro.selectedDate.year}-${pro.selectedDate.month}-${pro.selectedDate.day}',textAlign: TextAlign.center,)),
                SizedBox(height: 20,),
              ],
            )
            ),
            ElevatedButton(onPressed: (){
              pro.addTask(context);
            }, child: Text(AppLocalizations.of(context)!.add))
          ],
        ),
      ),
    );
  }

}

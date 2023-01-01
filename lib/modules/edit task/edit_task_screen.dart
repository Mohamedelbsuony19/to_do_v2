import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/user-model.dart';

import '../../shared/provider/setting-provider.dart';


class editTaskScreen extends StatelessWidget {
  static const String routeName='edit';
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<settingProvider>(context);
    late var arg=ModalRoute.of(context)?.settings.arguments as taskModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.toDo),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment(0, 0),
        margin: EdgeInsets.only(
            left:MediaQuery.of(context).size.width*0.1,
            top:MediaQuery.of(context).size.width*0.1
        ),
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: pro.isLight?Colors.white:Color(0xFF707070)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.edaiteTask,
                style:Theme.of(context).textTheme.headline1!.copyWith(
                    color: pro.isLight?Colors.black:Colors.white
                ) ,
              ),
              TextFormField(
                initialValue: arg.tittle,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.title
                ),
                onChanged: (text){
                  arg.tittle=text;
                },
                validator: (text){
                  if(text==null || text.isEmpty){
                    return 'please enter tittle';
                  }return null;
                },
              ),
              SizedBox( height: MediaQuery.of(context).size.height*0.1,
              ),
              TextFormField(
                initialValue: arg.descrption,
                decoration: InputDecoration(
                    labelText:  AppLocalizations.of(context)!.taskDetalis
                ),
                onChanged: (text){
                  arg.descrption=text;
                },
                validator: (text){
                  if(text==null || text.isEmpty){
                    return 'please enter tittle';
                  }return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.3,
              ),
              ElevatedButton(onPressed: (){
                pro.editethisTask(arg);
                Navigator.pop(context);
              },
                  child: Text('Save Changes'))


            ],
          ),
        ),
      ),
    );
  }

}
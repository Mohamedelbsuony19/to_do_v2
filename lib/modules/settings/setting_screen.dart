import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/modules/settings/themeBtnSheet.dart';
import 'package:untitled/shared/style/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/provider/setting-provider.dart';
import 'langBtnSheet.dart';

class settingsScreen extends StatelessWidget {
  static const String routeName='setting';
  @override
  Widget build(BuildContext context) {
    late var pro= Provider.of<settingProvider>(context,listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color:pro.isLight? Colors.black:Colors.white,
              fontWeight: FontWeight.bold
            ),),
          ),
          InkWell(
            onTap: (){
              showModelBtnSheetTheme(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.08,
              child: Text(AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(),
              ),
              decoration: BoxDecoration(
                 color: pro.isLight?Colors.white:Color(0xFF707070),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:Color(0xFF5D9CEC),
                  width: 1.5
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.langauge,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color:pro.isLight? Colors.black:Colors.white,
                fontWeight: FontWeight.bold
            ),),
          ),
          InkWell(
            onTap: (){
              showModelBtnSheetLang(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.08,
              child: Text(AppLocalizations.of(context)!.english,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  // color:             //تغير اللون
                ),
              ),
              decoration: BoxDecoration(
                  color: pro.isLight?Colors.white:Color(0xFF707070),

    borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color:Color(0xFF5D9CEC),
                      width: 1.5
                  )
              ),
            ),
          ),
        ],
    );
  }

  void showModelBtnSheetTheme(BuildContext context) {
showModalBottomSheet(
    context: context,
    builder: (BuildContext){
      return themeBtnSheet();
    }
);
  }
  void showModelBtnSheetLang(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext){
          return langBtnSheet();
        }
    );
  }

}

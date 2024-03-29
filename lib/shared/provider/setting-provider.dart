import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/user-model.dart';
import '../fire_base/fire_base_utils.dart';
import '../style/my_theme.dart';

class settingProvider extends ChangeNotifier {
  late bool isLight = true;
  late bool isSelectEnglish = true;
  late String appLang = 'en';
  late ThemeData myTheme=MyTheme.lightTheme;
  void editethisTask(taskModel task){
    editeTask(task);
    notifyListeners();
  }
  void changeTheme(ThemeData theme,BuildContext context) {
    myTheme = theme;
    notifyListeners();
  }
  void changeLang(String lang,BuildContext context){
    appLang=lang;
    notifyListeners();
  }
}

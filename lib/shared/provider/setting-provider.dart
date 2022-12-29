import 'package:flutter/material.dart';

import '../style/my_theme.dart';

class settingProvider extends ChangeNotifier {
  late bool isLight = true;
  late bool isSelectEnglish = true;
  late String appLang = 'en';
  late ThemeData myTheme=MyTheme.lightTheme;
  void changeTheme(ThemeData theme) {
    myTheme = theme;
    isLight=!isLight;
    notifyListeners();
  }
  void changeLang(String lang){
    appLang=lang;
    isSelectEnglish=!isSelectEnglish;
    notifyListeners();
  }
}

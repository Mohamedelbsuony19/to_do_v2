import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/layout/home_layout.dart';
import 'package:untitled/modules/settings/setting_screen.dart';
import 'package:untitled/modules/edit task/edit_task_screen.dart';
import 'package:untitled/modules/taskes_list/tasks_list_screen.dart';
import 'package:untitled/shared/provider/addTaskSheet_provider.dart';
import 'package:untitled/shared/provider/app_provider.dart';
import 'package:untitled/shared/provider/setting-provider.dart';
import 'package:untitled/shared/provider/list-tasks-prvider.dart';
import 'package:untitled/shared/style/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (buildContext) => appProvider(),),
    ChangeNotifierProvider(create: (buildContext) => addTaskSheetProvider()),
    ChangeNotifierProvider(create: (BuildContext)=>listTasksProvider()),
    ChangeNotifierProvider(create: (BuildContext)=>settingProvider())
  ], child: myApp()));
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late var pro=Provider.of<settingProvider>(context);
    return MaterialApp(
      routes: {
        homeLayout.routName: (buildContext) => homeLayout(),
        tasksListScreen.routeName: (buildContext) => tasksListScreen(),
        settingsScreen.routeName: (buildContext) => settingsScreen(),
        editTaskScreen.routeName:(buildContext)=> editTaskScreen(),
      },
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      initialRoute: homeLayout.routName,
      theme: pro.myTheme,
      locale:Locale(pro.appLang),
    );
  }
}

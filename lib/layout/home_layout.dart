import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/modules/taskes_list/add_btn_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/shared/provider/app_provider.dart';

import '../shared/provider/setting-provider.dart';

class homeLayout extends StatelessWidget {
  static const String routName = 'home';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appProvider>(context);
    var providerSetting = Provider.of<settingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.toDo,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: provider.screens[provider.curent],
      bottomNavigationBar: BottomAppBar(
        color:providerSetting.isLight?Colors.white:Color(0xFF707070) ,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (int index) {
            provider.changeScreen(index);
          },
          currentIndex: provider.curent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBtnSheet(context);
        },
        shape: StadiumBorder(
            side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary, width: 4)),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showAddTaskBtnSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => addBtnSheet());
  }
}

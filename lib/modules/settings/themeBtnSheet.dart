import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/shared/provider/setting-provider.dart';
import 'package:untitled/shared/style/my_theme.dart';

class themeBtnSheet extends StatelessWidget{
  const themeBtnSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<settingProvider>(context);

    return Container(
      color: pro.isLight ? Colors.white : Colors.black,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                pro.isLight=true;
                pro.changeTheme(MyTheme.lightTheme,context);
              },
              child: getLangRow(pro.isSelectEnglish ? 'Light' : 'فاتح',
                  pro.isLight, context)),
          InkWell(
              onTap: () {
                pro.isLight=false;
                pro.changeTheme(MyTheme.Darkheme,context);
              },
              child: getLangRow(pro.isSelectEnglish ? 'Dark' : 'داكن',
                  pro.isLight ? false : true, context)),
        ],
      ),
    );
  }
  Widget getLangRow(String text, bool isSelcted, context) {
    var pro=Provider.of<settingProvider>(context);
    if (isSelcted) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Color(0xFF5D9CEC)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.done,
                color: Color(0xFF5D9CEC),
              ),
            )
          ],
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(text,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: pro.isLight ? Colors.black : Colors.white,
                ))
          ],
        ),
      );
    }
  }

}

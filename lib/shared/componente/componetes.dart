import 'package:flutter/material.dart';

Widget defaultFromFaild({
  required TextEditingController controller,
  required TextInputType type,
  dynamic onSubmit,
  dynamic onChange,
  dynamic ontab,
  bool isPasword = false,
  required dynamic validate,
  required String lable,
  required IconData prefix,
  IconData? suffix,
  dynamic sufixpressed,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPasword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: ontab,
        validator: validate,
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: sufixpressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: OutlineInputBorder(),
        ));

showLoading(String message, BuildContext context, {bool isCansleble = false}) {
  showDialog(
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          content: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              )
            ],
          ),
        );
      },
      barrierDismissible: isCansleble);
}

hidenLoaing(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
    BuildContext context,
    String message, //الرساله الل هتظهر تقول لليوزر جاري اضافه التاسك
    String posActionText, // نص الزرار الل هو مثلا ok
    VoidCallback posAction, //الل function بتاعته
    {String? negActoinText = null,
    VoidCallback? negAction = null,
    bool isCancleble = true}) {
  showDialog(
      context: context,
      barrierDismissible: isCancleble,
      builder: (buildContext) {
        return AlertDialog(
            content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message),
        ),
          actions: [
            TextButton(onPressed: posAction, child: Text(posActionText)),
          ],
        );
      });
}

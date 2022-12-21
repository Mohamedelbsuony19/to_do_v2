import 'package:flutter/material.dart';

Widget defaultFromFaild({
required TextEditingController controller,
required TextInputType type,
  dynamic onSubmit,
  dynamic onChange,
  dynamic ontab,
  bool isPasword=false,
  required dynamic validate,
  required String lable,
  required IconData prefix,
  IconData? suffix,
  dynamic sufixpressed,
}) =>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPasword,
  onFieldSubmitted: onSubmit ,
  onChanged: onChange,
  onTap: ontab,
  validator: validate,
  decoration: InputDecoration(
    labelText: lable,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix !=null ? IconButton(
    onPressed: sufixpressed,
      icon: Icon(
        suffix,
      ),
    ):null,
    border: OutlineInputBorder(),
  )
);
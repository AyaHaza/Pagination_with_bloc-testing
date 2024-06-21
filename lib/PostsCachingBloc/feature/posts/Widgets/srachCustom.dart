import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';



Widget TextFiledSrarchCustom(String text,IconData iconData,Function(String)?func){

  return TextFormField(
    style: TextStyle(color:Constant.secondColor),
    // autofocus: false,
    onChanged: func,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: 10),
      focusColor: Constant.grey,
      prefixIcon: Icon(
        iconData,
        color: Constant.darkgrey,
      ),
      hintText: text,
      hintStyle: TextStyle(
        color:  Constant.darkgrey,
      ),
      filled: true,
      fillColor: Constant.grey!,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Constant.grey!)
      ),
      focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Constant.grey!)
      ),
    ),
  );
}
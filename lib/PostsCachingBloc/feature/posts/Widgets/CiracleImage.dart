
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';

Widget CircleImage (String image,String name){
  return  Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 20,top: 14),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Constant.secondColor, // border color
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(2.4), // border width
          child: Container(
            clipBehavior: Clip.antiAlias,// or ClipRRect if you need to clip the content
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Constant.secondColor, // inner circle color
            ),
            child:  Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            )// inner content
          ),

      ),
      Padding(
        padding: EdgeInsets.only(left: 20,top: 8),
        child: Text(name),
      ),
    ],
  );
}
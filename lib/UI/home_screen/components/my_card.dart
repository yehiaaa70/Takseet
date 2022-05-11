import 'package:flutter/material.dart';

import '../../../Constants/MyColors.dart';

Widget myCard(
{required String name,
required String icon,
pressFunction,}) {
  return SizedBox(
    height: 130,
    width: 180,
    child: GestureDetector(
      onTap: pressFunction,
      child: Card(
        elevation: 30,
        ////
        color: MyColors.myDarkGreen,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 40,
              width: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 18,color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}

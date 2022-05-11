import 'package:flutter/material.dart';

import '../../../Constants/MyColors.dart';
import 'my_space.dart';

Widget header(context) {
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      color: MyColors.myDark,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  const Text(
                    "10/5/2022",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  mySpace(height: 5.0),
                  const Text(
                    " 8:05PM ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Image.asset(
                    "assets/images/logo2.png",
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

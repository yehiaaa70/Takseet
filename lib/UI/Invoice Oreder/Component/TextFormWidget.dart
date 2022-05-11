import 'package:flutter/material.dart';

import '../../../Constants/MyColors.dart';
import '../../Methods.dart';

Widget myTextForm({required TextEditingController control,required String text,required TextInputType textType,required bool enable,required IconData icons} ){
  return TextFormField(
    enabled: enable,
    textAlign: TextAlign.center,
    controller: control,
    textDirection: TextDirection.rtl,
    keyboardType: textType,
    decoration:  InputDecoration(
      prefixIcon:  Icon(
       icons,
        color: MyColors.myDarkGreen,
      ),
      hintTextDirection: TextDirection.rtl,
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide:  BorderSide(color: MyColors.myDarkGreen),
      ),
      labelText: text,
      labelStyle: const TextStyle(color: MyColors.myDarkGreen),
      alignLabelWithHint: true,
    ),
  );
}
//
// Widget myButton(){
//   return ElevatedButton.icon(
//     label: const Text("حفط",
//         style: TextStyle(fontSize: 20)),
//     style: ButtonStyle(
//         foregroundColor:
//         MaterialStateProperty.all<Color>(
//             Colors.white),
//         backgroundColor:
//         MaterialStateProperty.all<Color>(
//             MyColors.myDarkGreen),
//         shape: MaterialStateProperty.all<
//             RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 side: const BorderSide(
//                     color: Colors.white)))),
//     onPressed: () async {
//       Methods.chickData(controler);
//     },
//     icon: const Icon(
//       Icons.save,
//     ),
//   );
// }
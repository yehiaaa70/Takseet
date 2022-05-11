
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Methods  {
  static  chickData(List<TextEditingController>listControl) {
    for(int i =0;i<listControl.length;i++){
      if(listControl[i].text.isNotEmpty){
        clearData(listControl);
      }else{
        Fluttertoast.showToast(
            msg: "برجاء اكمال باقى البيانات",
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.amber,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
      }
    }
  }
  static  clearData(List<TextEditingController>listControl) {
    for(int i =0;i<listControl.length;i++){
      listControl[i].clear();
    }
  }
}

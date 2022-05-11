import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takseet/Constants/MyColors.dart';

class NewClient extends StatefulWidget {
  const NewClient({Key? key}) : super(key: key);

  @override
  State<NewClient> createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  var nameClientControl = TextEditingController();

  var numOfClientControl = TextEditingController();

  var addressClientControl = TextEditingController();

  var idClientControl = TextEditingController();

  final picker = ImagePicker();

  late Future<PickedFile?> pickedFile = Future.value(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "اضافه عميل",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  TextFormField(
                    textAlign: TextAlign.right,
                    controller: nameClientControl,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_add_rounded,
                        color: MyColors.myDarkGreen,
                      ),
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.myDarkGreen),
                      ),
                      labelText: "اسم العميل",
                      labelStyle: TextStyle(color: MyColors.myDarkGreen),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    textAlign: TextAlign.right,
                    controller: numOfClientControl,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: MyColors.myDarkGreen,
                      ),
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.myDarkGreen),
                      ),
                      labelText: "رقم الهاتف ",
                      labelStyle: TextStyle(color: MyColors.myDarkGreen),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    textAlign: TextAlign.right,
                    controller: nameClientControl,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.home,
                        color: MyColors.myDarkGreen,
                      ),
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.myDarkGreen),
                      ),
                      labelText: "العنوان",
                      labelStyle: TextStyle(color: MyColors.myDarkGreen),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    textAlign: TextAlign.right,
                    controller: idClientControl,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: MyColors.myDarkGreen,
                      ),
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.myDarkGreen),
                      ),
                      labelText: "رقم البطاقه",
                      labelStyle: TextStyle(color: MyColors.myDarkGreen),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  pickedFile = picker
                                      .getImage(source: ImageSource.camera)
                                      .whenComplete(() => {setState(() {})});
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: MyColors.myDark,
                                )),
                            const SizedBox(
                              height: 80,
                            ),
                            IconButton(
                              onPressed: () async {
                                pickedFile = picker
                                    .getImage(
                                      source: ImageSource.gallery,
                                    )
                                    .whenComplete(() => {setState(() {})});
                              },
                              icon: const Icon(Icons.photo_camera_back,
                                  color: MyColors.myDark),
                            ),
                          ],
                        ),
                        Expanded(
                          child: FutureBuilder<PickedFile?>(
                            future: pickedFile,
                            builder: (context, snap) {
                              if (snap.hasData) {
                                return SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.file(
                                    File(snap.data!.path),
                                    fit: BoxFit.scaleDown,
                                  ),
                                );
                              }
                              return Container(
                                height: 200.0,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                          child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: ElevatedButton.icon(
                          label:
                              const Text("حفط", style: TextStyle(fontSize: 20)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColors.myDarkGreen),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                          color: Colors.white)))),
                          onPressed: () async {
                            chickData();
                          },
                          icon: const Icon(
                            Icons.save,
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: ElevatedButton.icon(
                          label: Text("الغاء".toUpperCase(),
                              style: const TextStyle(fontSize: 20)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                          color: Colors.white)))),
                          onPressed: () {
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: "تم الغاء العمليه",
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  chickData() {
    if (nameClientControl.text.isNotEmpty &&
        numOfClientControl.text.isNotEmpty &&
        addressClientControl.text.isNotEmpty &&
        idClientControl.text.isNotEmpty ) {
      saveData();
    } else {
      Fluttertoast.showToast(
          msg: "برجاء اكمال باقى البيانات",
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  clearData() {
    nameClientControl.clear();
    numOfClientControl.clear();
    addressClientControl.clear();
    idClientControl.clear();
  }

  saveData() async {
  }
}

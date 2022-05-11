import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Constants/MyColors.dart';
import '../Methods.dart';
import 'Component/TextFormWidget.dart';

class InvoiceOrder extends StatefulWidget {
  InvoiceOrder({Key? key}) : super(key: key);

  @override
  State<InvoiceOrder> createState() => _InvoiceOrderState();
}

class _InvoiceOrderState extends State<InvoiceOrder> {
  String? periodId;

  String? dateOfOrderRecord;
  String? dateOfSales;
  String? dateOfFirstMoney;

  var orderNumControl = TextEditingController();

  var nameClientControl = TextEditingController();

  var presenterControl = TextEditingController();

  var restControl = TextEditingController();

  var salesNumControl = TextEditingController();

  var salesValueControl = TextEditingController();

  var periodControl = TextEditingController();

  var percentControl = TextEditingController();

  var finalValueControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    orderNumControl.text = "0";
    salesNumControl.text = "0";
    finalValueControl.text = "350";
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("أمر التقسيط",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                myTextForm(text: "رقم العمليه",control: orderNumControl ,textType:TextInputType.number ,enable:false ,icons: Icons.numbers),
                const SizedBox(height: 18),
                myTextForm(text: "اسم العميل",control: nameClientControl ,textType:TextInputType.text ,enable:true,icons: Icons.person ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(child: myTextForm(text: "رقم الشراء",control: salesNumControl ,textType:TextInputType.number ,enable:false,icons: Icons.numbers )),
                    const SizedBox(width: 25),
                    Expanded(child: myTextForm(text: "قيمه الشراء",control: salesValueControl ,textType:TextInputType.number ,enable:true ,icons: Icons.monetization_on)),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(child: myTextForm(text: "الدفعه المقدمه",control: presenterControl ,textType:TextInputType.number ,enable:true,icons: Icons.money )),
                    const SizedBox(width: 25),
                    Expanded(child: myTextForm(text: "الباقى",control: restControl ,textType:TextInputType.number ,enable:true,icons: Icons.money_off )),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          labelText: "نوع مدة السداد",
                          border: OutlineInputBorder(),
                        ),
                        value: periodId,
                        hint: const Text("نوع مدة السداد"),
                        items: <String>['اسبوع', 'الشهر', 'ربع سنه', 'سنه']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(child: Text(value)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          periodId = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(child: myTextForm(text: "مدة السداد",control: periodControl ,textType:TextInputType.number ,enable:true,icons: Icons.more_time )),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(child: myTextForm(text: "قيمه الفائده",control: percentControl ,textType:TextInputType.number ,enable:true,icons: Icons.percent )),
                    const SizedBox(width: 25),
                    Expanded(child: myTextForm(text: "قيمه القسط",control: finalValueControl ,textType:TextInputType.number ,enable:true,icons: Icons.attach_money )),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: Text(
                          dateOfOrderRecord == null
                              ? "تاريخ تسجيل هذه العمليه"
                              : dateOfOrderRecord!,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    )),
                    IconButton(
                        onPressed: () async {
                          BottomPicker.date(
                                  title: "اختر التاريخ",
                                  titleStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.blue),
                                  onSubmit: (index) {
                                    setState(() {
                                      dateOfOrderRecord =
                                          index.toString().substring(0, 11);
                                    });
                                  },
                                  bottomPickerTheme:
                                      BOTTOM_PICKER_THEME.plumPlate)
                              .show(context);
                        },
                        icon: const Icon(
                          Icons.date_range,
                          color: MyColors.myDark,
                        )),
                    const SizedBox(
                      width: 25,
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: Text(
                          dateOfSales == null
                              ? "تاريخ شراء المنتج "
                              : dateOfSales!,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    )),
                    IconButton(
                        onPressed: () async {
                          BottomPicker.date(
                                  title: "اختر تاريخ",
                                  titleStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.blue),
                                  onSubmit: (index) {
                                    setState(() {
                                      dateOfSales =
                                          index.toString().substring(0, 11);
                                    });
                                  },
                                  bottomPickerTheme:
                                      BOTTOM_PICKER_THEME.plumPlate)
                              .show(context);
                        },
                        icon: const Icon(
                          Icons.date_range,
                          color: MyColors.myDark,
                        )),
                    const SizedBox(
                      width: 25,
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                          child: Text(
                              dateOfFirstMoney == null
                                  ? "تاريخ اول قسط "
                                  : dateOfFirstMoney!,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        )),
                    IconButton(
                        onPressed: () async {
                          BottomPicker.date(
                              title: "اختر تاريخ",
                              titleStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blue),
                              onSubmit: (index) {
                                setState(() {
                                  dateOfFirstMoney =
                                      index.toString().substring(0, 11);
                                });
                              },
                              bottomPickerTheme:
                              BOTTOM_PICKER_THEME.plumPlate)
                              .show(context);
                        },
                        icon: const Icon(
                          Icons.date_range,
                          color: MyColors.myDark,
                        )),
                    const SizedBox(width: 25)
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: ElevatedButton.icon(
                            label: const Text("حفط",
                                style: TextStyle(fontSize: 20)),
                            style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    MyColors.myDarkGreen),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: const BorderSide(
                                            color: Colors.white)))),
                            onPressed: () async {
                              List<TextEditingController> controler = [
                              nameClientControl,
                              orderNumControl,
                              presenterControl,
                              restControl,
                              salesNumControl,
                              salesValueControl,
                              periodControl,
                              percentControl,
                              finalValueControl,
                              ];
                              Methods.chickData(controler);
                            },
                            icon: const Icon(
                              Icons.save,
                            ),
                          ),
                        )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: ElevatedButton.icon(
                            label: Text("الغاء".toUpperCase(),
                                style: const TextStyle(fontSize: 20)),
                            style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
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
                const SizedBox(height: 40),

              ],
            ),
          ),
        ),
      ),
    );
  }
  saveData() async {}
}

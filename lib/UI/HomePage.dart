import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:takseet/UI/ClientScreens/AddClient.dart';
import 'package:takseet/UI/Invoice%20Oreder/Order.dart';

import 'StartScreens/Component/widget_card_item.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  String date = DateFormat.yMMMd().format(DateTime.now());
  String allTimeFormatted = DateFormat('KK:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 30,
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 110,
                      child: Image.asset(
                        'assets/images/logo.png',
                        alignment: Alignment.topCenter,
                        height: 110,
                        width: 110,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      // _scaffold.currentState!.openEndDrawer();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/menu.png"),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 30.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("اهلا بك ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              )),
                          Text(
                            "تقسيطك",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          ' ${date}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          ' ${allTimeFormatted}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                        child: cardItem(
                            icon: "assets/images/client_icon.png",
                            name: "اضافه عميل",
                            pressFunction: () async {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  NewClient()),
                              );

                            })),
                    Spacer(),
                    Expanded(
                        child: cardItem(
                      pressFunction: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  InvoiceOrder()),
                        );
                      },
                      icon: "assets/images/payment_icon.png",
                      name: "امر تقسيط",
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

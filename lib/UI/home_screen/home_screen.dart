import 'package:flutter/material.dart';

import '../../Constants/MyColors.dart';
import '../ClientScreens/AddClient.dart';
import '../Invoice Oreder/Order.dart';
import 'components/header.dart';
import 'components/my_card.dart';
import 'components/my_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myDark,
        elevation: 2,
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              header(context),
              mySpace(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myCard(
                      icon: "assets/images/client_icon.png",
                      name: "اضافه عميل",
                      pressFunction: ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  NewClient()),
                        );

                      }),
                  mySpace(width: 40.0),
                  myCard(
                    pressFunction: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  InvoiceOrder()),
                      );
                    },
                    icon: "assets/images/payment_icon.png",
                    name: "امر تقسيط",
                  ),
                ],
              ),
              mySpace(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myCard(
                    pressFunction: () async {},
                    icon: "assets/images/payment_icon.png",
                    name: "سجل الاقساط",
                  ),
                  mySpace(width: 40.0),
                  myCard(
                    pressFunction: () async {},
                    icon: "assets/images/payment_icon.png",
                    name: "امر الدفع",
                  )
                ],
              ),
              mySpace(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../Constants/MyColors.dart';
import '../HomePage.dart';
import '../home_screen/home_screen.dart';
import 'Component/PasswordField.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: MyColors.myGreen,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                            child: Center(
                                child: Text(
                          "تسجيل الدخول",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 70, left: 12, right: 12),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/logo2.png",
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(height: 35.0),
                            TextFormField(
                              textAlign: TextAlign.right,
                              controller: userNameController,
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle_rounded,
                                  color: MyColors.myDarkGreen,
                                ),
                                hintTextDirection: TextDirection.rtl,
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors.myDarkGreen),
                                ),
                                labelText: "اسم المستخدم",
                                labelStyle:
                                    TextStyle(color: MyColors.myDarkGreen),
                                alignLabelWithHint: true,
                              ),
                            ),
                            const SizedBox(height: 35.0),
                            PasswordField(
                              controller: passwordController,
                              fieldKey: _passwordFieldKey,
                              helperText:
                                  'كلمه المرور لا تتعدى 8 احرف او ارقام',
                              labelText: 'كلمه المرور',
                            ),
                            const SizedBox(height: 50.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 70,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MyColors.myGreen),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  color: Colors.green)))),
                                  onPressed: () {

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  HomeScreen()),
                                    );

                                  },
                                  child: const Text(
                                    "دخول",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            const SizedBox(height: 35.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

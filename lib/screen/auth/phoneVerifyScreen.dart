import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/screen/auth/loginScreen.dart';
import 'package:lily/widgets/loadingScreen.dart';
import 'package:lily/widgets/otpTextField.dart';
import 'package:lily/widgets/snackbarView.dart';

class PhoneVerify extends StatefulWidget {
  const PhoneVerify({super.key});

  @override
  State<PhoneVerify> createState() => PhoneVerifyState();
}

class PhoneVerifyState extends State<PhoneVerify> {
  final _formKey = GlobalKey<FormState>();

  final valOTP1 = TextEditingController();
  final valOTP2 = TextEditingController();
  final valOTP3 = TextEditingController();
  final valOTP4 = TextEditingController();

  bool isFailed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Spacer(),
                Image.asset(
                  logo,
                  height: 85.0,
                  width: 85.0,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                Text(
                  "DMO",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                ),
                // const Spacer(),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Verify User",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                    ),
                    Center(
                      child: Text(
                        "Check pin from your SMS/Email",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Form(
                          key: _formKey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              otpTextField(
                                context: context,
                                height: MediaQuery.of(context).size.height,
                                first: true,
                                last: false,
                                controller: valOTP1,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              otpTextField(
                                context: context,
                                height: MediaQuery.of(context).size.height,
                                first: false,
                                last: false,
                                controller: valOTP2,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              otpTextField(
                                context: context,
                                height: MediaQuery.of(context).size.height,
                                first: false,
                                last: false,
                                controller: valOTP3,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              otpTextField(
                                context: context,
                                height: MediaQuery.of(context).size.height,
                                first: false,
                                last: true,
                                controller: valOTP4,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Padding(
                          padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  //After authentication result
                                  //If there is network failure
                                  showCloseSnackBar(context,
                                      isNO: true,
                                      title: "oops...Snap!",
                                      msg: "Network failure, connect internet");

                                  //If the user signup failed
                                  // showCloseSnackBar(context,
                                  //     isNO: true,
                                  //     title: "User Verification",
                                  //     msg:
                                  //         "User verification failed, try again");
                                  // setState(() {
                                  //   isFailed = true;
                                  // });

                                  //If the user created successfully
                                  showCloseSnackBar(context,
                                      title: "User Verification",
                                      msg: "User verification is successful");
                                  Timer(const Duration(seconds: 5), () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => LoadingScreen(
                                            screen: const LoginScreen()),
                                      ),
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  "Verify",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                )),
                          ),
                        ),
                        if (isFailed)
                          TextButton(
                              onPressed: () {},
                              child: const Text("Resend code"))
                      ],
                    ),
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

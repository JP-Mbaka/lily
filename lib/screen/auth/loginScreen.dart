import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/screen/auth/forgottenPassScreen.dart';
import 'package:lily/screen/auth/signupScreen.dart';
import 'package:lily/screen/Dashboard/home.dart';
import 'package:lily/widgets/loadingScreen.dart';
import 'package:lily/widgets/snackbarView.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameCOntroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool pass = false;
  bool isWrongPass = true;

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
                      "Existing user",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            controller: usernameCOntroller,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: const InputDecoration(
                                label: Text("Username"),
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          TextFormField(
                            controller: passwordController,
                            autocorrect: false,
                            enableSuggestions: false,
                            obscureText: pass,
                            decoration: InputDecoration(
                              label: const Text("Password"),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: showPass,
                                icon: const Icon(Icons.remove_red_eye_rounded),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isWrongPass)
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const ForgotPassScreen()));
                  },
                  child: Text(
                    "Forgotten password? Click here",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.error),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      //After authentication result
                      //If there is network failure
                      // showCloseSnackBar(context,
                      //     isNO: true,
                      //     title: "oops...Snap!",
                      //     msg: "Network failure, connect internet");

                      //If the user logged failed
                      // showCloseSnackBar(context,
                      //     isNO: true,
                      //     title: "Login Failed",
                      //     msg: "User is not logged in, try again");

                      //If the user logged in successfully
                      showCloseSnackBar(context,
                          title: "Login Successful",
                          msg: "User is logged in successfully");

                      Timer(const Duration(seconds: 5), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => LoadingScreen(
                                screen: HomeScreen(selectedIndex: 0)),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A new user?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const SignupScreen()));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  showPass() {
    setState(() {
      pass = !pass;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/screen/auth/loginScreen.dart';
import 'package:lily/screen/auth/phoneVerifyScreen.dart';
import 'package:lily/screen/auth/signupScreen.dart';
import 'package:lily/widgets/loadingScreen.dart';
import 'package:lily/widgets/popUpAlert.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => ForgotPassScreenState();
}

class ForgotPassScreenState extends State<ForgotPassScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameCOntroller = TextEditingController();

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
                      "Request New Password",
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
                                label: Text("Username/Email"),
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Padding(
                            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if ((usernameCOntroller.text.length < 10) ||
                                        usernameCOntroller.text.isEmpty ||
                                        !usernameCOntroller.text
                                            .contains(RegExp(r'[@|.]'))) {
                                      PopDialogs.alertMessage(
                                        icon: failedIcon,
                                        context: context,
                                        message: "Enter a valid email address",
                                      );
                                    } else {
                                      PopDialogs.popDialogs(
                                          context: context,
                                          title: "Password Reset",
                                          message:
                                              "Are you sure you want to reset your password?",
                                          yes: "Yes",
                                          no: "No",
                                          onPressYes: () {
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (_) => LoadingScreen(
                                                        screen:
                                                            const PhoneVerify())));
                                          });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(20),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    "Reset Password",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                child: Text(
                  "Login to your account",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
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
                      Navigator.of(context).push(MaterialPageRoute(
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
}

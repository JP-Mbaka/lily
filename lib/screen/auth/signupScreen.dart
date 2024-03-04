import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/screen/auth/loginScreen.dart';
import 'package:lily/screen/auth/phoneVerifyScreen.dart';
import 'package:lily/widgets/loadingScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fnameCOntroller = TextEditingController();
  TextEditingController lnameCOntroller = TextEditingController();
  TextEditingController emailCOntroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameCOntroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  TextEditingController compNameController = TextEditingController();
  TextEditingController businessNoController = TextEditingController();

  bool pass = false;
  bool confPass = false;
  bool isUser = true;
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
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
                height: isUser
                    ? MediaQuery.of(context).size.height * 0.9
                    : MediaQuery.of(context).size.height * 1.2,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (isUser)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isUser = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text("USER"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              padding: const EdgeInsets.all(8.0),
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    isUser = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text("COMPANY"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!isUser)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              padding: const EdgeInsets.all(8.0),
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    isUser = true;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text("USER"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isUser = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text("COMPANY"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!isUser)
                            TextFormField(
                              controller: compNameController,
                              autocorrect: false,
                              enableSuggestions: false,
                              decoration: const InputDecoration(
                                  label: Text("Company Name"),
                                  border: OutlineInputBorder()),
                            ),
                          if (!isUser)
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                          if (!isUser)
                            TextFormField(
                              controller: businessNoController,
                              autocorrect: false,
                              enableSuggestions: false,
                              decoration: const InputDecoration(
                                  label: Text("Registration/Business No."),
                                  border: OutlineInputBorder()),
                            ),
                          if (!isUser)
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            controller: fnameCOntroller,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: InputDecoration(
                                label: Text(isUser
                                    ? "First Name"
                                    : "Contact First Name"),
                                border: const OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            controller: lnameCOntroller,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: InputDecoration(
                                label: Text(
                                    isUser ? "Last Name" : "Contact Last Name"),
                                border: const OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            controller: emailCOntroller,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: const InputDecoration(
                                label: Text("Email"),
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            controller: phoneController,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: const InputDecoration(
                                label: Text("Phone Number"),
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
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
                                  MediaQuery.of(context).size.height * 0.02),
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
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            controller: passwordController,
                            autocorrect: false,
                            enableSuggestions: false,
                            obscureText: confPass,
                            decoration: InputDecoration(
                              label: const Text("Confirm Password"),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: showConfPass,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text.rich(TextSpan(
                    text: "I have read & agree to the",
                    style: TextStyle(fontSize: 10))),
                TextButton(
                  onPressed: () {
                    Uri url = Uri.https('subscribedmo.dmo.gov.ng', '/terms');
                    launchURL(url);
                  },
                  child: const Text("Terms & Conditions",
                      style: TextStyle(fontSize: 10)),
                ),
                Checkbox.adaptive(
                    value: agreed,
                    onChanged: (val) {
                      setState(() {
                        agreed = val ?? false;
                      });
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => LoadingScreen(
                            screen: PhoneVerify(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a user?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) =>
                              LoadingScreen(screen: const LoginScreen())));
                    },
                    child: Text(
                      "Login",
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

  showConfPass() {
    setState(() {
      confPass = !confPass;
    });
  }

  showAgreed() {
    setState(() {
      agreed = !agreed;
    });
  }

  launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

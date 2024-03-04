import 'package:flutter/material.dart';
import 'package:lily/constants/variables.dart';
import 'package:url_launcher/url_launcher.dart';

class GetHelp extends StatefulWidget {
  const GetHelp({super.key});

  @override
  State<GetHelp> createState() => GetHelpState();
}

class GetHelpState extends State<GetHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  SizedBox(height: height(context) * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: width(context) * 0.05),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: width(context) * 0.05),
                      Text(
                        "Get Help",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Contact Us",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Head Office:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                        SizedBox(
                          width: width(context) * 0.55,
                          child: Text(
                              "NDIC Building (1st Floor),Plot 447/448 Constitution Avenue,Central Business District,P.M.B. 532, Garki Abuja, Nigeria.",
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Telephone:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                        Text("+2348110000881",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                        IconButton.filled(
                            onPressed: () {
                              launchUrl(
                                Uri(scheme: 'tel', path: '+2348110000881'),
                              );
                            },
                            icon: const Icon(Icons.phone))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Email:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                        Text("nquiries@dmo.gov.ng",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                        SizedBox(width: width(context) * 0.12)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              // final mailtoUri = Uri(
                              //     scheme: 'mailto',
                              //     path: 'nquiries@dmo.gov.ng',
                              //     queryParameters: {
                              //       'subject': "Enquiries on Subscription"
                              //     });

                              launchUrl(Uri.dataFromString(
                                  "mailto:nquiries@dmo.gov.ng?subject=Enquiries on Subscription&body=Good day [sir/ma], I am making enquiry"));
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Send Mail",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            )),
                      ),
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

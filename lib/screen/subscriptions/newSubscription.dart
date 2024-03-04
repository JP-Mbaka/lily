import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/screen/Payment/paystackPage.dart';

class NewSubscription extends StatefulWidget {
  const NewSubscription({super.key});

  @override
  State<NewSubscription> createState() => NewSubscriptionState();
}

class NewSubscriptionState extends State<NewSubscription> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameCOntroller = TextEditingController();
  TextEditingController chnCntroller = TextEditingController();
  TextEditingController banknameCOntroller = TextEditingController();
  TextEditingController bankaccountCOntroller = TextEditingController();

  final int _rangeVal = 0;

  bool hasCHN = true;

  final List<DropdownMenuItem> _range = [
    const DropdownMenuItem<int>(value: 0, child: Text("Individual")),
    const DropdownMenuItem<int>(value: 1, child: Text("Joint")),
    const DropdownMenuItem<int>(value: 2, child: Text("Corporate")),
  ];
  final int _brokerVal = 0;

  final List<DropdownMenuItem> _brokerList = [
    const DropdownMenuItem<int>(value: 0, child: Text("Select Broker")),
    const DropdownMenuItem<int>(value: 1, child: Text("The Bulb")),
    const DropdownMenuItem<int>(value: 2, child: Text("Seawood")),
    const DropdownMenuItem<int>(value: 3, child: Text("JAPAHub")),
    const DropdownMenuItem<int>(value: 4, child: Text("NGIX")),
    const DropdownMenuItem<int>(value: 5, child: Text("CYN")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Subscription"),
        elevation: 5,
      ),
      backgroundColor: Colors.green[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                height: MediaQuery.of(context).size.height * 0.85,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Subscription",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                              icon: const Icon(Icons.arrow_drop_down),
                              value: _rangeVal,
                              items: _range,
                              onChanged: (val) {
                                print(val);
                              },
                              // onTap: () {
                              //   print(_rangeVal);
                              // },
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                  value: hasCHN,
                                  onChanged: (val) {
                                    setState(() {
                                      hasCHN = val ?? true;
                                    });
                                  }),
                              const Text("Has CHN?")
                            ],
                          ),
                          if (hasCHN)
                            TextFormField(
                              controller: chnCntroller,
                              autocorrect: false,
                              enableSuggestions: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: const Text("CHN number"),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                  border: const OutlineInputBorder()),
                            ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                              icon: const Icon(Icons.arrow_drop_down),
                              value: _brokerVal,
                              items: _brokerList,
                              onChanged: (val) {
                                print(val);
                              },
                              // onTap: () {
                              //   print(_rangeVal);
                              // },
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            controller: banknameCOntroller,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: InputDecoration(
                                label: const Text("Bank Name"),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                border: const OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            controller: bankaccountCOntroller,
                            autocorrect: false,
                            enableSuggestions: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                label: const Text("Bank Account"),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                border: const OutlineInputBorder()),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Padding(
                            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    MakePayment(context: context)
                                        .chargeCardAndMakePayment();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(20),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    "Subcribe",
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
          ],
        ),
      ),
    );
  }
}

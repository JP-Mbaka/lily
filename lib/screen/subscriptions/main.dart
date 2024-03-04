import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/constants/variables.dart';
import 'package:lily/screen/subscriptions/modal.dart';
import 'package:lily/screen/subscriptions/newSubscription.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => SubscriptionState();
}

class SubscriptionState extends State<Subscription> {
  final List<DropdownMenuItem> _range = [
    const DropdownMenuItem<int>(value: 0, child: Text("5 days")),
    const DropdownMenuItem<int>(value: 1, child: Text("1 week")),
    const DropdownMenuItem<int>(value: 2, child: Text("1 month")),
    const DropdownMenuItem<int>(value: 3, child: Text("3 months")),
    const DropdownMenuItem<int>(value: 4, child: Text("1 year")),
  ];
  int _rangeVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  SizedBox(height: height(context) * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subscriptions",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_bag))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "NGN",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Text(
                          "₦2,562,342.84",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Jun 12 - Jul 28",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                  SizedBox(
                                    width: width(context) * 0.3,
                                    child: DropdownButtonFormField(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                      icon: const Icon(Icons.arrow_drop_down),
                                      value: _rangeVal,
                                      items: _range,
                                      onChanged: (val) {
                                        print(val);
                                      },
                                      onTap: () {
                                        print(_rangeVal);
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                color: Colors.blueAccent,
                                height: height(context) * 0.45,
                                width: double.infinity,
                                // width: width(context) * 0.45,
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub History",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            IconButton.filled(
                                onPressed: () {
                                  historyModal(context);
                                },
                                icon: const Icon(Icons.more_horiz))
                          ],
                        ),
                        SizedBox(
                          height: height(context) * 0.38,
                          width: double.infinity,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: (height(context) * 0.15) / 2,
                                child: Card(
                                  elevation: 5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(failedTIcon,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                      Text(
                                        "Gribbs",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                      Text(
                                        "20 Jun 2023",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                      Icon(Icons.remove_red_eye,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.01,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NewSubscription(),
            ),
          );
        },
        elevation: 5,
        child: const Icon(
          Icons.add,
          weight: 5,
        ),
      ),
    );
  }
}

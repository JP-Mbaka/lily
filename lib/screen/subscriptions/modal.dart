import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/constants/variables.dart';

void historyModal(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: height(context),
          child: Column(
            children: [
              SizedBox(height: height(context) * 0.04),
              Row(
                children: [
                  IconButton.filled(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      weight: 12,
                      size: 40,
                    ),
                  ),
                  Text(
                    "Subscription History",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: height(context) * 0.86,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: (height(context) * 0.2) / 2,
                          child: Card(
                            elevation: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(failedTIcon,
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
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
                                    color:
                                        Theme.of(context).colorScheme.primary)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      });
}

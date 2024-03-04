import 'package:flutter/material.dart';
import 'package:lily/constants/variables.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  List<Map<String, dynamic>> faqsList = [
    {
      "id": 1,
      "question":
          "Why is DMO/CBN paying a low nominal value of the quarterly interests than estimated",
      "answer": "DMO to provide answer",
    },
    {
      "id": 2,
      "question":
          "Are there any bank charges or federal/state taxes on FGN Bonds quarterly interests",
      "answer": "DMO to provide answer",
    },
    {
      "id": 3,
      "question": "Is FGN Bond not tax free",
      "answer": "Taxes are not applied to any class of bonds",
    },
    {
      "id": 4,
      "question": "How can I subscribe to FGN savings bond",
      "answer":
          "Subscription on FGN bond could either be through the DMO subscription platform or through a Distribution Agent (DA)",
    },
    {
      "id": 5,
      "question":
          "How often is the FGN savings bond open for subscription available",
      "answer":
          "Two (2) FGN saving bonds (2&3 years) are available for subscription every month.",
    },
    {
      "id": 6,
      "question":
          "Is it possible to buy/sell FGN savings bond through the secondary market",
      "answer": "Yes",
    },
    {
      "id": 7,
      "question":
          "Can I seamlessly change my submitted data as regards crediting of coupon e.g. bank details",
      "answer": "Yes",
    },
    {
      "id": 8,
      "question":
          "Does subscription for FGN savings bond through the primary market attracts any transaction fee",
      "answer": "No",
    },
    {
      "id": 9,
      "question":
          "What is the minimum amount required to invest in FGN savings bond",
      "answer": "N5,000 (five thousand naira)",
    },
    {
      "id": 10,
      "question": "What is the value amount of a FGN saving/sukuk bond",
      "answer":
          "1 unit of the FGN saving/sukuk bond is worth N1,000 face value",
    },
    {
      "id": 11,
      "question":
          "Can I subscribe to FGN savings bond without having a CSCS account",
      "answer":
          "No (you are required to have an existing CSCS account, if not, on subscription one will be opened for you)",
    },
    {
      "id": 12,
      "question":
          "Must I go through a stockbroker to subscribe or can I invest directly through DMO's platforms",
      "answer": "Both options are available",
    },
    {
      "id": 13,
      "question": "How often is coupon payment for FGN savings bond",
      "answer": "Every three (3) months from the issue date.",
    },
    {
      "id": 14,
      "question": "Is there a regular rate of coupon for FGN savings bond",
      "answer": "DMO to provide answer",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      "FAQS",
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
              SizedBox(height: height(context) * 0.02),
              SizedBox(
                height: height(context) * 0.8,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: faqsList.length,
                    itemBuilder: (context, index) {
                      return _FAQDesign(
                        context,
                        key: faqsList[index]['id'],
                        title: faqsList[index]['question'],
                        message: faqsList[index]['answer'],
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _FAQDesign(context, {key, title = '', message = ''}) {
    if (title == '' || message == '') {
      return;
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 20),
      // padding: const EdgeInsets.all(10.0),
      child: ExpansionTile(
        key: PageStorageKey(key),
        iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        collapsedIconColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.4),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        title: Padding(
          padding: const EdgeInsets.all(10.0).copyWith(top: 20, bottom: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        // trailing: _isExpanded ? Icon(Icons.keyboard_arrow_down, color: GREY.withOpacity(0.4), size: 30,) : Icon(Icons.arrow_forward_ios, color: GREY.withOpacity(0.4), size: 20,) ,
        children: [
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          SizedBox(height: height(context) * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0)
                .copyWith(bottom: 10.0),
            child: Text(
              message,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
        onExpansionChanged: (expand) => setState(() {}),
      ),
    );
  }
}

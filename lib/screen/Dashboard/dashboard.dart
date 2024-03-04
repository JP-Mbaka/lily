import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  final formKey = GlobalKey<FormState>();
  final searchText = TextEditingController();

  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                  width: double.infinity,
                  height: height * 0.12,
                  child: Center(
                    child: ListTile(
                      leading: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2)),
                          child: CircleAvatar(
                            // backgroundColor:
                            // Theme.of(context).colorScheme.primary,
                            // radius: width * 0.25,
                            child: Text(
                              "LM",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "Lucas Madenig",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ), //Fullname
                      subtitle: Text(
                        "@lmate1",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ), //Username
                      trailing: IconButton.filled(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  )),
            ),
            // Card(child: Row(

            // ))
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 4),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      // style: TextStyle(
                      //     backgroundColor:
                      //         Theme.of(context).colorScheme.onTertiaryContainer),
                      controller: searchText,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search more options..."),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 4.0),
              child: Card(
                elevation: 5,
                color: Theme.of(context).colorScheme.primary,
                child: Container(
                  height: height * 0.15,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Balance",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                            SizedBox(height: height * 0.02),
                            FittedBox(
                              child: Text(
                                "₦200,00.58",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary),
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 4.0),
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               "Sub History",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .bodyMedium!
            //                   .copyWith(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 18,
            //                     color: Theme.of(context).colorScheme.primary,
            //                   ),
            //             ),
            //             IconButton.filled(
            //                 onPressed: () {}, icon: Icon(Icons.more_horiz))
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: height * 0.2,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: 3,
            //           itemBuilder: (context, index) {
            //             // return GridTile(child: Image.asset(logo));
            //             return Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                 children: [
            //                   Container(
            //                     height: height * 0.12,
            //                     decoration: BoxDecoration(
            //                         color: Colors.red,
            //                         borderRadius: BorderRadius.circular(50)),
            //                     child: Image.asset(logo),
            //                   ),
            //                   const Text("Gilbert")
            //                 ],
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 4.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
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
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        IconButton.filled(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (height * 0.15) / 2,
                    child: Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(failedTIcon,
                                color: Theme.of(context).colorScheme.error),
                            Text(
                              "Subs",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            Text(
                              "20 Jun 2023",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            Icon(Icons.remove_red_eye,
                                color: Theme.of(context).colorScheme.primary)
                          ],
                        )

                        //  ListTile(
                        //   leading: Image.asset(failedTIcon),
                        //   title: const Text(
                        //     "Subscription",
                        //     style: TextStyle(fontSize: 10),
                        //   ),
                        //   subtitle: Text(
                        //     "Tue, 20 Jun 2023",
                        //     style: TextStyle(fontSize: 10),
                        //   ),
                        // ),
                        ),
                  ),
                  SizedBox(
                    height: (height * 0.15) / 2,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(failedTIcon,
                              color: Theme.of(context).colorScheme.tertiary),
                          Text(
                            "Gribbs",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Text(
                            "20 Jun 2023",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Icon(Icons.remove_red_eye,
                              color: Theme.of(context).colorScheme.primary)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 4.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction History",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        IconButton.filled(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (height * 0.15) / 2,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(failedTIcon,
                              color: Theme.of(context).colorScheme.error),
                          Text(
                            "Subs",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Text(
                            "20 Jun 2023",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Icon(Icons.remove_red_eye,
                              color: Theme.of(context).colorScheme.primary)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (height * 0.15) / 2,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(failedTIcon,
                              color: Theme.of(context).colorScheme.error),
                          Text(
                            "Subs",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Text(
                            "20 Jun 2023",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Icon(Icons.remove_red_eye,
                              color: Theme.of(context).colorScheme.primary)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';

// ignore: must_be_immutable
class LoadingScreen extends StatefulWidget {
  Widget screen;

  LoadingScreen({super.key, required this.screen});
  @override
  State<LoadingScreen> createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => widget.screen));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              height: 125.0,
              width: 125.0,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Image.asset(
              loaderNormal,
              height: 125.0,
              width: 125.0,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text("...Loading"),
          ],
        ),
      ),
    );
  }
}

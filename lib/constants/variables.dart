import 'package:flutter/material.dart';

//MediaQuery Width
double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//MediaQuery Height
double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

const double HORIZONTAL_PADDING = 40.0;
const double VERTICAL_PADDING = 50.0;

const int ROUTE_DURATION = 800;

class ConstantKey {
  static const String PAYSTACK_KEY =
      "pk_live_6b3296f6ab7efa374cbe591c2685754cabc34f73";
}

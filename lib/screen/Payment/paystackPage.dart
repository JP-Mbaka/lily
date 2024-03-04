import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/constants/variables.dart';

class MakePayment {
  MakePayment(
      {required this.context,
      this.price = 1200,
      this.email = "lucasmadenig@yahoo.com"});

  BuildContext context;
  int price;
  String email;

  PaystackPlugin paystack = PaystackPlugin();

  Future initializePlugin() async {
    await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

//References
  String _getReference() {
    String platform = "";
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "iOS";
    }

    return "chargefrom${platform}_${DateTime.now().microsecondsSinceEpoch}";
  }

  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..accessCode = "wnh2112"
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(context,
          charge: charge,
          logo: Image.asset(
            logo,
            width: 50,
            height: 50,
          ),
          fullscreen: true);

      if (response.status) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Transaction is successful")));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Transaction is failed, Try again")));
      }
    });
  }
}
